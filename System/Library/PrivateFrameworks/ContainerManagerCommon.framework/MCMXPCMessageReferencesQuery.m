@interface MCMXPCMessageReferencesQuery
- (BOOL)createDuringReconciliation;
- (BOOL)deleteDuringReconciliation;
- (BOOL)yesReallyApplyToAll;
- (MCMUserIdentity)userIdentity;
- (MCMXPCMessageReferencesQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unint64_t)explicitFlags;
- (unint64_t)privateFlags;
- (unsigned)uid;
@end

@implementation MCMXPCMessageReferencesQuery

- (void).cxx_destruct
{
  p_userIdentity = &self->_userIdentity;

  objc_storeStrong((id *)p_userIdentity, 0);
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)yesReallyApplyToAll
{
  return self->_yesReallyApplyToAll;
}

- (BOOL)deleteDuringReconciliation
{
  return self->_deleteDuringReconciliation;
}

- (BOOL)createDuringReconciliation
{
  return self->_createDuringReconciliation;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (MCMXPCMessageReferencesQuery)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MCMXPCMessageReferencesQuery;
  v10 = [(MCMXPCMessageWithOwnersAndGroupsBase *)&v29 initWithXPCObject:v8 context:v9 error:a5];
  if (v10)
  {
    unint64_t v28 = 1;
    v10->_privateFlags = xpc_dictionary_get_uint64(v8, "PrivateFlags");
    v10->_unint64_t explicitFlags = xpc_dictionary_get_uint64(v8, "Explicit");
    v11 = [v9 clientIdentity];
    v12 = [v11 userIdentity];
    v13 = [v12 posixUser];
    v10->_uid = [v13 UID];

    if ((v10->_explicitFlags & 8) != 0) {
      v10->_uid = xpc_dictionary_get_uint64(v8, "UID");
    }
    char uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v10->_createDuringReconciliation = uint64 & 1;
    v10->_deleteDuringReconciliation = (uint64 & 2) != 0;
    v10->_yesReallyApplyToAll = (uint64 & 4) != 0;
    v15 = [(MCMXPCMessageBase *)v10 context];
    v16 = [v15 userIdentityCache];
    if (![(id)objc_opt_class() personasAreSupported])
    {

LABEL_14:
      goto LABEL_15;
    }
    unint64_t explicitFlags = v10->_explicitFlags;

    if ((explicitFlags & 4) != 0)
    {
      v18 = [v9 clientIdentity];
      uint64_t v19 = [v18 userIdentity];
      userIdentity = v10->_userIdentity;
      v10->_userIdentity = (MCMUserIdentity *)v19;

      if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:[(MCMXPCMessageWithOwnersAndGroupsBase *)v10 containerClass]])
      {
        string = xpc_dictionary_get_string(v8, "PersonaUniqueString");
        if (string)
        {
          uint64_t v22 = [NSString stringWithUTF8String:string];
          if (v22)
          {
            v23 = (void *)v22;
            v24 = [v9 clientIdentity];
            uint64_t v25 = [(MCMXPCMessageBase *)v10 userIdentityFromClientPersonaUniqueString:v23 clientIdentity:v24 error:&v28];
            v26 = v10->_userIdentity;
            v10->_userIdentity = (MCMUserIdentity *)v25;

            if (v28 != 1)
            {
              if (a5) {
                *a5 = v28;
              }
              v15 = v10;
              v10 = 0;
              goto LABEL_14;
            }
          }
        }
      }
    }
  }
LABEL_15:

  return v10;
}

@end