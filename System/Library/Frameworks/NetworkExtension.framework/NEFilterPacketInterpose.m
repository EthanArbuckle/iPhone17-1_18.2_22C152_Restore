@interface NEFilterPacketInterpose
- (BOOL)matchFlow:(const unsigned __int8 *)a3 flowId:;
- (id)description;
- (void)close;
- (void)close:(os_unfair_lock_s *)a1;
- (void)close_nolock:(uint64_t)a1;
- (void)dealloc;
- (void)deallocateFrame:(uint64_t)a1;
- (void)freePacket:(os_unfair_lock_s *)a1;
@end

@implementation NEFilterPacketInterpose

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nexusInstance, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_interface, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (id)description
{
  if (self->_channel)
  {
    v3 = NSString;
    name = nw_interface_get_name((nw_interface_t)self->_interface);
    [v3 stringWithFormat:@"NEFilterPacketInterpose: %s - [%@:%d - fd %d]", name, objc_getProperty(self, v5, 176, 1), self->_nexusPort, self->_channel_fd];
LABEL_5:
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  interface = self->_interface;
  if (interface)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"NEFilterPacketInterpose: %s", nw_interface_get_name(interface), v9, v10, v11);
    goto LABEL_5;
  }
  v7 = @"NEFilterPacketInterpose";
LABEL_6:

  return v7;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  -[NEFilterPacketInterpose close:]((os_unfair_lock_s *)self, 0);
  context = self->_context;
  self->_context = 0;

  v5.receiver = self;
  v5.super_class = (Class)NEFilterPacketInterpose;
  [(NEFilterPacketInterpose *)&v5 dealloc];
}

- (void)close:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v4 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)close_nolock:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@: close: StopInputOnly %d", (uint8_t *)&v10, 0x12u);
  }

  if (*(unsigned char *)(a1 + 152))
  {
    *(unsigned char *)(a1 + 153) = 1;
  }
  else
  {
    *(unsigned char *)(a1 + 153) = 0;
    if (*(void *)(a1 + 192))
    {
      objc_super v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        uint64_t v11 = a1;
        _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "%@: close channel: cancel input", (uint8_t *)&v10, 0xCu);
      }

      nw_queue_cancel_source();
      *(void *)(a1 + 192) = 0;
      *(unsigned char *)(a1 + 152) = 0;
    }
    if ((a2 & 1) == 0 && *(void *)(a1 + 16))
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v10 = 138412290;
        uint64_t v11 = a1;
        _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@: close channel: cancel channel", (uint8_t *)&v10, 0xCu);
      }

      os_channel_destroy();
      *(void *)(a1 + 16) = 0;
      *(_DWORD *)(a1 + 32) = -1;
      objc_setProperty_atomic((id)a1, v7, 0, 176);
      *(void *)(a1 + 184) = 0;
      *(_DWORD *)(a1 + 156) = 0;
      *(_DWORD *)(a1 + 160) = 0;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_OWORD *)(a1 + 112) = 0u;
      if (*(void *)(a1 + 24))
      {
        os_channel_attr_destroy();
        *(void *)(a1 + 24) = 0;
      }
      *(void *)(a1 + 88) = 0;
      uint64_t v8 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      uint64_t v9 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0;
    }
  }
}

- (void)close
{
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, 1);
    os_unfair_lock_unlock(v2);
  }
}

- (BOOL)matchFlow:(const unsigned __int8 *)a3 flowId:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v11 = 0;
  *(void *)uint64_t v8 = 0;
  uint64_t v9 = 0;
  objc_msgSend(objc_getProperty(a1, a2, 176, 1), "getUUIDBytes:", uu1);
  objc_msgSend(objc_getProperty(a1, v6, 168, 1), "getUUIDBytes:", v8);
  return !uuid_compare(uu1, (const unsigned __int8 *)a2) && uuid_compare(v8, a3) == 0;
}

void __40__NEFilterPacketInterpose_createChannel__block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = *(void *)(a1 + 32);
    *(_DWORD *)v65 = 138412290;
    *(void *)&v65[4] = v51;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "%@: INPUT SOURCE: READ EVENT", v65, 0xCu);
  }

  v3 = *(unsigned char **)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    nw_queue_suspend_source();
    v4 = (char *)*(id *)(a1 + 32);
    if (!v4) {
      goto LABEL_100;
    }
    goto LABEL_9;
  }
  if ((v3[152] & 1) == 0)
  {
    v3[152] = 1;
    goto LABEL_6;
  }
  v4 = v3;
LABEL_9:
  uint64_t v52 = a1;
  objc_super v5 = (os_unfair_lock_s *)(v4 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)v4 + 2);
  int v6 = 0;
  int v7 = 0;
  char v8 = 1;
  lock = (os_unfair_lock_s *)(v4 + 8);
  do
  {
    char v9 = v8;
    if (v8) {
      uint64_t v10 = 96;
    }
    else {
      uint64_t v10 = 112;
    }
    if (*(void *)&v4[v10])
    {
      char v60 = v8;
      int v11 = os_channel_available_slot_count();
      if (v11)
      {
        int v12 = v11;
        int v56 = v7;
        int v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v65 = 138412802;
          v47 = "INGRESS";
          if ((v60 & 1) == 0) {
            v47 = "EGRESS";
          }
          *(void *)&v65[4] = v4;
          *(_WORD *)&v65[12] = 2080;
          v59 = v47;
          *(void *)&v65[14] = v47;
          *(_WORD *)&v65[22] = 1024;
          *(_DWORD *)&v65[24] = v12;
          char v9 = v60;
          _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "%@: receiveFramesfromRings: %s: avail slots %d", v65, 0x1Cu);
        }
        else
        {
          char v9 = v60;
          uint64_t v14 = "EGRESS";
          if (v60) {
            uint64_t v14 = "INGRESS";
          }
          v59 = v14;
        }

        if (v9) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = 2;
        }
        uint64_t v16 = 120;
        if (v9) {
          uint64_t v16 = 104;
        }
        uint64_t v54 = v16;
        uint64_t v55 = v15;
        while (1)
        {
          v17 = v4;
          long long v66 = 0u;
          long long v67 = 0u;
          memset(v65, 0, sizeof(v65));
          if (!*(void *)&v4[v10])
          {
            v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 2080;
              *(void *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = @"Bad rx ring";
              v24 = v23;
              goto LABEL_42;
            }
            goto LABEL_43;
          }
          uint64_t next_slot = os_channel_get_next_slot();
          if (!next_slot)
          {
            v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 2080;
              *(void *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = @"NULL next slot";
              v24 = v23;
              goto LABEL_42;
            }
            goto LABEL_43;
          }
          if (!*(void *)&v65[16])
          {
            v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 2080;
              *(void *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = @"NULL prop buf";
              v24 = v23;
              goto LABEL_42;
            }
LABEL_43:

            if (!*((void *)v4 + 2)) {
              goto LABEL_46;
            }
            goto LABEL_44;
          }
          uint64_t v19 = next_slot;
          *((void *)v4 + 5) = next_slot;
          uint64_t packet = os_channel_slot_get_packet();
          if (!packet)
          {
            v23 = ne_log_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 2080;
              *(void *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = @"Bad ptr";
              v24 = v23;
LABEL_42:
              _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
            }
            goto LABEL_43;
          }
          uint64_t v21 = packet;
          if (!os_channel_slot_detach_packet()) {
            break;
          }
          v22 = ne_log_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v62 = v4;
            __int16 v63 = 2080;
            *(void *)v64 = v59;
            *(_WORD *)&v64[8] = 2112;
            *(void *)&v64[10] = @"Bad detach";
            _os_log_error_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
          }

          if (!*((void *)v4 + 2)) {
            goto LABEL_46;
          }
LABEL_63:
          os_channel_packet_free();
LABEL_44:
          if (os_channel_is_defunct()) {
            goto LABEL_45;
          }
LABEL_46:
          int v25 = 0;
LABEL_47:

          v6 += v25;
          if (!os_channel_available_slot_count()) {
            goto LABEL_89;
          }
        }
        uint64_t next_buflet = os_packet_get_next_buflet();
        if (next_buflet)
        {
          uint64_t v27 = next_buflet;
          unsigned int data_offset = os_buflet_get_data_offset();
          uint64_t object_address = os_buflet_get_object_address();
          if (object_address)
          {
            uint64_t v29 = object_address;
            uint64_t data_length = (unsigned __int16)os_packet_get_data_length();
            v31 = ne_log_obj();
            uint64_t v53 = data_length;
            if (!data_length)
            {
              v37 = v31;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v62 = v4;
                __int16 v63 = 2080;
                *(void *)v64 = v59;
                *(_WORD *)&v64[8] = 2112;
                *(void *)&v64[10] = @"Bad frame length";
                _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
              }

              objc_super v5 = (os_unfair_lock_s *)(v4 + 8);
              if (!*((void *)v4 + 2))
              {
LABEL_80:
                int v25 = 0;
                char v9 = v60;
                goto LABEL_47;
              }
              os_channel_packet_free();
              char v9 = v60;
              if (!os_channel_is_defunct()) {
                goto LABEL_46;
              }
LABEL_45:
              os_unfair_lock_lock(v5);
              -[NEFilterPacketInterpose close_nolock:]((uint64_t)v17, 1);
              os_unfair_lock_unlock(v5);
              goto LABEL_46;
            }
            v32 = v31;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 1024;
              *(_DWORD *)v64 = v53;
              *(_WORD *)&v64[4] = 2080;
              *(void *)&v64[6] = v59;
              _os_log_debug_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_DEBUG, "%@: receiveDatafromRing: read %u bytes on %s rx ring", buf, 0x1Cu);
            }

            *((void *)v4 + 5) = v19;
            if (!os_channel_advance_slot())
            {
              uint64_t v38 = v29 + data_offset;
              v4[48] = v56;
              *((void *)v4 + 7) = v38;
              *((_DWORD *)v4 + 16) = v53;
              *((void *)v4 + 9) = v21;
              *((void *)v4 + 10) = v27;
              *((void *)v4 + 11) = v4 + 48;
              v39 = (void *)*((void *)v4 + 18);
              if (v39) {
                objc_setProperty_atomic(v39, v33, v17, 8);
              }
              os_unfair_lock_unlock(lock);
              v40 = [*((id *)v4 + 16) packetHandler];
              uint64_t v41 = v40[2](v40, *((void *)v4 + 18), *((void *)v4 + 17), v55, v38, v53);

              objc_super v5 = (os_unfair_lock_s *)(v4 + 8);
              os_unfair_lock_lock(lock);
              v43 = (void *)*((void *)v4 + 18);
              if (v43) {
                objc_setProperty_atomic(v43, v42, 0, 8);
              }
              if (!*((void *)v4 + 2)) {
                goto LABEL_80;
              }
              v44 = ne_log_obj();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v62 = v4;
                __int16 v63 = 2048;
                *(void *)v64 = v41;
                _os_log_debug_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_DEBUG, "%@: receiveDatafromRing: verdict %ld", buf, 0x16u);
              }

              if (v41 != 2)
              {
                char v9 = v60;
                if (!v41)
                {
                  uint64_t v45 = *(void *)&v4[v54];
                  if (v45)
                  {
                    sendDataOnRing(v17, v45, v56);
                    int v25 = 1;
                    goto LABEL_47;
                  }
                }
                goto LABEL_85;
              }
              char v9 = v60;
              if (*((void *)v4 + 11))
              {
                v46 = ne_log_obj();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v62 = v4;
                  _os_log_error_impl(&dword_19DDAF000, v46, OS_LOG_TYPE_ERROR, "%@: receiveDatafromRing: returned Delay verdict but packet hasn't been delayed", buf, 0xCu);
                }

                *((void *)v4 + 11) = 0;
LABEL_85:
                if (*((void *)v4 + 2)) {
                  os_channel_packet_free();
                }
                goto LABEL_46;
              }
              goto LABEL_46;
            }
            v34 = ne_log_obj();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              __int16 v63 = 2080;
              *(void *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(void *)&v64[10] = @"Failed to advance slot";
              _os_log_error_impl(&dword_19DDAF000, v34, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
            }

            objc_super v5 = (os_unfair_lock_s *)(v4 + 8);
            char v9 = v60;
            if (!*((void *)v4 + 2)) {
              goto LABEL_46;
            }
            goto LABEL_63;
          }
          v35 = ne_log_obj();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            goto LABEL_62;
          }
          *(_DWORD *)buf = 138412802;
          v62 = v4;
          __int16 v63 = 2080;
          *(void *)v64 = v59;
          *(_WORD *)&v64[8] = 2112;
          *(void *)&v64[10] = @"Bad address";
          v36 = v35;
        }
        else
        {
          v35 = ne_log_obj();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            goto LABEL_62;
          }
          *(_DWORD *)buf = 138412802;
          v62 = v4;
          __int16 v63 = 2080;
          *(void *)v64 = v59;
          *(_WORD *)&v64[8] = 2112;
          *(void *)&v64[10] = @"Bad buflet";
          v36 = v35;
        }
        _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
LABEL_62:

        objc_super v5 = (os_unfair_lock_s *)(v4 + 8);
        if (!*((void *)v4 + 2)) {
          goto LABEL_46;
        }
        goto LABEL_63;
      }
    }
LABEL_89:
    char v8 = 0;
    int v7 = 1;
  }
  while ((v9 & 1) != 0);
  if (v6 && os_channel_sync())
  {
    v48 = ne_log_obj();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 138412290;
      *(void *)&v65[4] = v4;
      _os_log_error_impl(&dword_19DDAF000, v48, OS_LOG_TYPE_ERROR, "%@: receiveFramesfromRings: failed to sync channel TX", v65, 0xCu);
    }
  }
  os_unfair_lock_unlock(v5);

  a1 = v52;
LABEL_100:
  uint64_t v49 = *(void *)(a1 + 32);
  if (v49 && (*(unsigned char *)(v49 + 152) & 1) != 0)
  {
    *(unsigned char *)(v49 + 152) = 0;
    nw_queue_resume_source();
    uint64_t v49 = *(void *)(a1 + 32);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v49 + 8));
  uint64_t v50 = *(void *)(a1 + 32);
  if (v50 && *(unsigned char *)(v50 + 153))
  {
    -[NEFilterPacketInterpose close_nolock:](v50, 1);
    uint64_t v50 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v50 + 8));
}

- (void)freePacket:(os_unfair_lock_s *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = v3[5];
      if (v5)
      {
        os_unfair_lock_lock(a1 + 2);
        int v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v7 = *(_DWORD *)(v5 + 16);
          int v8 = 138412546;
          char v9 = a1;
          __int16 v10 = 1024;
          int v11 = v7;
          _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%@: freePacket: %d bytes", (uint8_t *)&v8, 0x12u);
        }

        -[NEFilterPacketInterpose deallocateFrame:]((uint64_t)a1, (void *)v5);
        v4[5] = 0;
        os_unfair_lock_unlock(a1 + 2);
      }
    }
  }
}

- (void)deallocateFrame:(uint64_t)a1
{
  if (*(void *)(a1 + 16) && ptr[3]) {
    os_channel_packet_free();
  }
  ptr[1] = 0;
  ptr[3] = 0;
  ptr[4] = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];

  CFAllocatorDeallocate(v3, ptr);
}

@end