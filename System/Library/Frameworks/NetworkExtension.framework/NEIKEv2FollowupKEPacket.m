@interface NEIKEv2FollowupKEPacket
+ (id)copyTypeDescription;
+ (unint64_t)exchangeType;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2FollowupKEPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);

  objc_storeStrong((id *)&self->_ke, 0);
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self) {
    self = (NEIKEv2FollowupKEPacket *)objc_getProperty(self, a2, 80, 1);
  }
  v3 = self;
  uint64_t v4 = [(NEIKEv2FollowupKEPacket *)v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = v8;
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              v14 = objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v11);
              goto LABEL_20;
            }
            v26 = v11;
            v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v26, 1, (void)v21);
            if (v2) {
LABEL_20:
            }
              objc_setProperty_atomic(v2, v13, v14, 64);

            if (v11 && v2 && v11[3] == 16441)
            {
              ptrdiff_t v18 = 96;
              v19 = v2;
              v20 = v11;
              goto LABEL_27;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_29;
            }
            if (v2 && objc_getProperty(v2, v15, 56, 1))
            {
              v11 = objc_msgSend(objc_getProperty(v2, v16, 56, 1), "arrayByAddingObject:", v8);
            }
            else
            {
              v25 = v8;
              v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1, (void)v21);
              if (!v2) {
                goto LABEL_28;
              }
            }
            v19 = v2;
            v20 = v11;
            ptrdiff_t v18 = 56;
LABEL_27:
            objc_setProperty_atomic(v19, v17, v20, v18);
          }
LABEL_28:

          goto LABEL_29;
        }
        if (v2) {
          objc_setProperty_atomic(v2, v9, v8, 88);
        }
LABEL_29:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NEIKEv2FollowupKEPacket *)v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    if (objc_getProperty(self, v4, 96, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80);
  }
  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

+ (unint64_t)exchangeType
{
  return 44;
}

+ (id)copyTypeDescription
{
  return @"IKE_FOLLOWUP_KE";
}

@end