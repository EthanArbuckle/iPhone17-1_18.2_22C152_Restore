@interface NEFilterPacketProvider
- (NEFilterPacketHandler)packetHandler;
- (NEPacket)delayCurrentPacket:(NEFilterPacketContext *)context;
- (void)allowPacket:(NEPacket *)packet;
- (void)setPacketHandler:(NEFilterPacketHandler)packetHandler;
@end

@implementation NEFilterPacketProvider

- (void).cxx_destruct
{
}

- (void)setPacketHandler:(NEFilterPacketHandler)packetHandler
{
}

- (NEFilterPacketHandler)packetHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)allowPacket:(NEPacket *)packet
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = packet;
  if (v3)
  {
    selfa = v3;
    v5 = objc_getProperty(v3, v4, 48, 1);

    v3 = selfa;
    if (v5)
    {
      uint64_t v7 = objc_getProperty(selfa, v6, 48, 1);
      v8 = selfa;
      v9 = v8;
      if (v7)
      {
        context = (unsigned __int8 *)v8->_context;
        if (context)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(v7 + 8));
          uint64_t v11 = *(void *)(v7 + 16);
          v12 = ne_log_obj();
          v13 = v12;
          if (v11)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              int v19 = *((_DWORD *)context + 4);
              *(_DWORD *)buf = 138412546;
              uint64_t v22 = v7;
              __int16 v23 = 1024;
              int v24 = v19;
              _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "%@: allowPacket: %d bytes", buf, 0x12u);
            }

            v14 = (char *)(id)v7;
            v15 = v14;
            uint64_t v16 = 120;
            if (!*context) {
              uint64_t v16 = 104;
            }
            if (*((void *)context + 3))
            {
              uint64_t v17 = *(void *)&v14[v16];
              if (v17)
              {
                sendDataOnRing(v14, v17, *context);
                if (os_channel_sync())
                {
                  v18 = ne_log_obj();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v22 = (uint64_t)v15;
                    _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@: allowPacket: failed to sync channel TX", buf, 0xCu);
                  }
                }
                *((void *)context + 3) = 0;
              }
            }
            -[NEFilterPacketInterpose deallocateFrame:]((uint64_t)v15, context);
            v9->_context = 0;
            os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 8));
          }
          else
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v22 = v7;
              _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "%@: allowPacket: no channel", buf, 0xCu);
            }

            -[NEFilterPacketInterpose freePacket:]((os_unfair_lock_s *)v7, v9);
            os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 8));
          }
        }
      }

      v3 = selfa;
    }
  }
}

- (NEPacket)delayCurrentPacket:(NEFilterPacketContext *)context
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = context;
  v5 = v3;
  if (!v3) {
    goto LABEL_21;
  }
  if (!objc_getProperty(v3, v4, 8, 1)) {
    goto LABEL_21;
  }
  Property = (os_unfair_lock_s *)objc_getProperty(v5, v6, 8, 1);
  if (!Property) {
    goto LABEL_21;
  }
  v8 = Property;
  v9 = Property + 2;
  os_unfair_lock_lock(Property + 2);
  if (!*(void *)&v8[4]._os_unfair_lock_opaque)
  {
    __int16 v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      os_unfair_lock_unlock(v9);
LABEL_21:
      uint64_t v22 = 0;
      goto LABEL_22;
    }
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v8;
    int v24 = "%@: delayCurrentPacket: no channel / input_queue";
LABEL_26:
    _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0xCu);
    goto LABEL_20;
  }
  v10 = *(long long **)&v8[22]._os_unfair_lock_opaque;
  if (!v10)
  {
    __int16 v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v8;
    int v24 = "%@: delayCurrentPacket: no current frame";
    goto LABEL_26;
  }
  uint64_t v11 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 40, 0);
  v12 = v11;
  if (v11)
  {
    long long v13 = *v10;
    long long v14 = v10[1];
    *((void *)v11 + 4) = *((void *)v10 + 4);
    *(_OWORD *)uint64_t v11 = v13;
    *((_OWORD *)v11 + 1) = v14;
  }
  *(void *)&v8[22]._os_unfair_lock_opaque = 0;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:*((void *)v11 + 1) length:*((unsigned int *)v11 + 4) freeWhenDone:0];
  uint64_t v16 = [NEPacket alloc];
  if (*v12) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  id v18 = v15;
  int v19 = v8;
  if (v16)
  {
    v26.receiver = v16;
    v26.super_class = (Class)NEPacket;
    v20 = [(NEProvider *)&v26 init];
    uint64_t v16 = (NEPacket *)v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->super.super._defaultPathEvaluator, v15);
      v16->_direction = v17;
      v16->_context = v12;
      objc_storeStrong((id *)&v16->_interpose, v8);
    }
  }

  v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v19;
    _os_log_debug_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_DEBUG, "%@: delayCurrentPacket: retained packet", (uint8_t *)&v26, 0xCu);
  }

  os_unfair_lock_unlock(v9);
  uint64_t v22 = v16;

LABEL_22:

  return v22;
}

@end