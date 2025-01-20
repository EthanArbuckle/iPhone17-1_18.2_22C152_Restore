@interface FBWorkspaceRegistration
+ (id)registrationWithIdentifier:(id)a3 options:(id)a4;
- (BOOL)acceptsClientScenes;
- (NSString)identifier;
- (id)description;
@end

@implementation FBWorkspaceRegistration

+ (id)registrationWithIdentifier:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) { {
      v9 = v8;
    }
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = objc_opt_class();
  id v12 = v6;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) { {
      v13 = v12;
    }
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v10)
  {
    uint64_t v15 = objc_opt_new();
    if (v15)
    {
      uint64_t v16 = [v10 copy];
      v17 = *(void **)(v15 + 16);
      *(void *)(v15 + 16) = v16;

      *(unsigned char *)(v15 + 8) = objc_msgSend(v14, "bs_BOOLForKey:", @"AcceptClientScenes");
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return (id)v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:0];
  id v5 = (id)[v3 appendBool:self->_acceptsClientScenes withName:@"acceptsClientScenes" ifEqualTo:1];
  id v6 = [v3 build];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)acceptsClientScenes
{
  return self->_acceptsClientScenes;
}

- (void).cxx_destruct
{
}

@end