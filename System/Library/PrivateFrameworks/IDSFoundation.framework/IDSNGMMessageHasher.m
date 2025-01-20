@interface IDSNGMMessageHasher
+ (id)computeHashForMessage:(id)a3;
@end

@implementation IDSNGMMessageHasher

+ (id)computeHashForMessage:(id)a3
{
  id v3 = a3;
  Class v4 = NSClassFromString(&cfstr_Ngmmessagehash.isa);
  if (v4)
  {
    v8 = objc_msgSend_computeHashForMessage_(v4, v5, (uint64_t)v3, v7);
  }
  else
  {
    v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D870();
    }

    v8 = 0;
  }

  return v8;
}

@end