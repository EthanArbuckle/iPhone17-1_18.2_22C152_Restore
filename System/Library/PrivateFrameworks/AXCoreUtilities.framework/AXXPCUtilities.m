@interface AXXPCUtilities
+ (id)copyXPCMessageFromDictionary:(id)a3 inReplyToXPCMessage:(id)a4 error:(id *)a5;
+ (id)dictionaryFromXPCMessage:(id)a3 error:(id *)a4;
@end

@implementation AXXPCUtilities

+ (id)dictionaryFromXPCMessage:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    *a4 = 0;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23 = @"XPC object was NULL";
      v8 = (void *)MEMORY[0x1E4F1C9E8];
      v9 = &v23;
      v10 = &v22;
      goto LABEL_16;
    }
  }
  else if (!v5)
  {
LABEL_18:
    a4 = 0;
    goto LABEL_19;
  }
  Class Class = object_getClass(v5);
  if (Class != (Class)MEMORY[0x1E4F14590])
  {
    if (Class == (Class)MEMORY[0x1E4F145A8])
    {
      if (!a4) {
        goto LABEL_19;
      }
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected error: %s.", xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E4F14530]));
      v27 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a4 = [v15 errorWithDomain:@"AXCoreUtilitiesXPCError" code:0 userInfo:v17];

      goto LABEL_17;
    }
    if (!a4) {
      goto LABEL_19;
    }
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25 = @"Unexpected type for XPC object";
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v25;
    v10 = &v24;
LABEL_16:
    v16 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    *a4 = [v7 errorWithDomain:@"AXCoreUtilitiesXPCError" code:0 userInfo:v16];
LABEL_17:

    goto LABEL_18;
  }
  v12 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  if (!v12)
  {
    if (!a4) {
      goto LABEL_19;
    }
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @"Failed converting XPC object to a Foundation level dictionary";
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v29;
    v10 = &v28;
    goto LABEL_16;
  }
  v13 = v12;
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 == CFDictionaryGetTypeID())
  {
    a4 = (id *)[v13 copy];
  }
  else if (a4)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"Converted XPC object is not a dictionary; instead it has the following type ID: %lu.",
    v20 = v14);
    v31[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    *a4 = [v19 errorWithDomain:@"AXCoreUtilitiesXPCError" code:0 userInfo:v21];

    a4 = 0;
  }
  CFRelease(v13);
LABEL_19:

  return a4;
}

+ (id)copyXPCMessageFromDictionary:(id)a3 inReplyToXPCMessage:(id)a4 error:(id *)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    *a5 = 0;
    if (!v7)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"No XPC dictionary";
      v11 = (void *)MEMORY[0x1E4F1C9E8];
      v12 = (__CFString **)v33;
      v13 = &v32;
LABEL_9:
      id v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
      [v10 errorWithDomain:@"AXCoreUtilitiesXPCError" code:0 userInfo:v16];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
  }
  else if (!v7)
  {
    id v15 = 0;
    goto LABEL_26;
  }
  if (!v8)
  {
    id v15 = 0;
    goto LABEL_12;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  id v15 = reply;
  if (a5 && !reply)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31 = @"Failed to allocate new XPC dictionary";
    v11 = (void *)MEMORY[0x1E4F1C9E8];
    v12 = &v31;
    v13 = &v30;
    goto LABEL_9;
  }
  if (reply)
  {
LABEL_12:
    v17 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    id v16 = v17;
    if (v17)
    {
      if (object_getClass(v17) == (Class)MEMORY[0x1E4F14590])
      {
        if (v9)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __73__AXXPCUtilities_copyXPCMessageFromDictionary_inReplyToXPCMessage_error___block_invoke;
          v24[3] = &unk_1E5673740;
          id v15 = v15;
          id v25 = v15;
          xpc_dictionary_apply(v16, v24);
        }
        else
        {
          id v16 = v16;
          id v15 = v16;
        }
        goto LABEL_25;
      }
      if (!a5)
      {
LABEL_20:
        if (v15)
        {

          id v15 = 0;
        }
        goto LABEL_25;
      }
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29 = @"Unexpected type for XPC object after conversion from Foundation level dictionary";
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = &v29;
      v21 = &v28;
    }
    else
    {
      if (!a5) {
        goto LABEL_20;
      }
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27 = @"Failed converting Foundation level dictionary to an XPC object";
      v19 = (void *)MEMORY[0x1E4F1C9E8];
      v20 = &v27;
      v21 = &v26;
    }
    uint64_t v22 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    *a5 = [v18 errorWithDomain:@"AXCoreUtilitiesXPCError" code:0 userInfo:v22];

    goto LABEL_20;
  }
LABEL_26:

  return v15;
}

uint64_t __73__AXXPCUtilities_copyXPCMessageFromDictionary_inReplyToXPCMessage_error___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

@end