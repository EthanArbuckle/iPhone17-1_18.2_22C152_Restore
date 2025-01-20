@interface BSAction
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)_expectsResponse;
- (BOOL)canSendResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BSAction)init;
- (BSAction)initWithBSXPCCoder:(id)a3;
- (BSAction)initWithCoder:(id)a3;
- (BSAction)initWithInfo:(id)a3 responder:(id)a4;
- (BSAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (BSAction)initWithXPCDictionary:(id)a3;
- (BSSettings)info;
- (NSString)debugDescription;
- (NSString)description;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:;
- (id)_initWithInfo:(void *)a3 responder:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)invalidate;
- (void)sendResponse:(id)a3;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)setNullificationHandler:(id)a3;
@end

@implementation BSAction

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  -[BSAction encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSAction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v3 = -[BSAction _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 0);
  return v3;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [a1 succinctDescriptionBuilder];
    [v6 setActiveMultilinePrefix:v5];
    [v6 setUseDebugDescription:a3];
    id v7 = (id)[v6 appendObject:a1[3] withName:@"info"];
    id v8 = (id)[v6 appendObject:a1[1] withName:@"responder"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = -[_BSActionResponder action_shortIdentifier]((os_unfair_lock_s *)self->_responder);
  id v5 = (id)[v3 appendObject:v4 withName:@"id" skipIfNil:1];

  return v3;
}

- (id)succinctDescription
{
  v3 = -[_BSActionResponder action_fullIdentifier]((os_unfair_lock_s *)self->_responder);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(BSAction *)self succinctDescriptionBuilder];
    id v5 = [v6 build];
  }
  return v5;
}

- (unint64_t)hash
{
  responder = self->_responder;
  if (responder && responder->_isOriginatorNull)
  {
    id v4 = +[BSHashBuilder builder];
    id v5 = [v4 appendObject:self->_info];
    unint64_t v6 = [v5 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BSAction;
    return [(BSAction *)&v8 hash];
  }
  return v6;
}

- (void)invalidate
{
  BOOL isImplicitOriginator = self->_isImplicitOriginator;
  responder = (os_unfair_lock_s *)self->_responder;
  if (isImplicitOriginator) {
    -[_BSActionResponder originator_annulWithErrorCode:](responder, 5uLL);
  }
  else {
    -[_BSActionResponder action_invalidate]((uint64_t)responder);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_responder, 0);
}

- (BOOL)canSendResponse
{
  return -[_BSActionResponder action_canSendResponse]((os_unfair_lock_s *)self->_responder);
}

- (void)dealloc
{
  [(BSSettings *)self->_info setDescriptionProvider:0];
  -[_BSActionResponder action_didDealloc]((uint64_t)self->_responder);
  v3.receiver = self;
  v3.super_class = (Class)BSAction;
  [(BSAction *)&v3 dealloc];
}

- (BSAction)initWithInfo:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = (os_unfair_lock_s *)a4;
  objc_super v8 = v7;
  if (v7)
  {
    os_unfair_lock_lock(v7 + 10);
    v9 = -[BSActionResponder _lock_underlying](v8);
    os_unfair_lock_unlock(v8 + 10);
  }
  else
  {
    v9 = +[_BSActionResponder originator_nullResponder]();
  }
  id v10 = -[BSAction _initWithInfo:responder:](self, v6, v9);
  v11 = (BSAction *)v10;
  if (v10)
  {
    uint64_t v12 = *((void *)v10 + 1);
    v13 = (objc_class *)objc_opt_class();
    -[_BSActionResponder originator_didInit:](v12, v13);
  }

  return v11;
}

- (id)_initWithInfo:(void *)a3 responder:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"responder"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithInfo_responder_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = a1;
        __int16 v23 = 2114;
        v24 = @"BSAction.m";
        __int16 v25 = 1024;
        int v26 = 188;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v12 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE3DF4);
    }
    v16.receiver = a1;
    v16.super_class = (Class)BSAction;
    id v8 = objc_msgSendSuper2(&v16, sel_init);
    if (v8)
    {
      uint64_t v9 = [v5 copy];
      id v10 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v9;

      [*((id *)v8 + 3) setDescriptionProvider:v8];
      *((unsigned char *)v8 + 16) = 0;
      objc_storeStrong((id *)v8 + 1, a3);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BSAction)initWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  id v5 = [(BSAction *)self initWithBSXPCCoder:v4];

  return v5;
}

- (BSAction)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  id v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"r"];
  id v7 = +[_BSActionResponder action_decodeFromXPCObject:]((uint64_t)_BSActionResponder, v6);

  id v8 = (BSAction *)-[BSAction _initWithInfo:responder:](self, v5, v7);
  return v8;
}

- (NSString)description
{
  return (NSString *)[(BSAction *)self descriptionWithMultilinePrefix:0];
}

- (BSSettings)info
{
  return self->_info;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_info forKey:@"i"];
  id v4 = -[_BSActionResponder action_encode:]((uint64_t)self->_responder, self);
  [v5 encodeObject:v4 forKey:@"r"];
}

- (void)sendResponse:(id)a3
{
  id v4 = a3;
  responder = self->_responder;
  id v6 = v4;
  id v8 = v4;
  if (!v4)
  {
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 4uLL);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[_BSActionResponder action:sendResponse:]((uint64_t)responder, self, v6);
  id v7 = v8;
  if (!v8)
  {

    id v7 = 0;
  }
}

- (BSAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = v11;
    if (!v11)
    {
      LODWORD(v14) = qos_class_self();
      if (v14 <= 0x15) {
        intptr_t v14 = 21;
      }
      else {
        intptr_t v14 = v14;
      }
      id v13 = dispatch_get_global_queue(v14, 0);
    }
    uint64_t v15 = +[_BSActionResponder originator_responderOnQueue:forHandler:]((uint64_t)_BSActionResponder, v13, v12);
    if (!v11) {

    }
    if (v15)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v15 + 96));
      *(unsigned char *)(v15 + 102) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 96));
    }
    if (a4 > 0.0 && fabs(a4) >= 2.22044605e-16)
    {
      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      -[_BSActionResponder originator_setTimeout:](v15, v16);
    }
  }
  else
  {
    uint64_t v15 = +[_BSActionResponder originator_nullResponder]();
  }
  id v17 = -[BSAction _initWithInfo:responder:](self, v10, (void *)v15);
  id v18 = (BSAction *)v17;
  if (v17)
  {
    *((unsigned char *)v17 + 16) = 1;
    uint64_t v19 = *((void *)v17 + 1);
    v20 = (objc_class *)objc_opt_class();
    -[_BSActionResponder originator_didInit:](v19, v20);
  }

  return v18;
}

- (BSAction)init
{
  return [(BSAction *)self initWithInfo:0 timeout:0 forResponseOnQueue:0 withHandler:0.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAction)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@",
      v7,
      v9);
  }
  id v10 = v4;
  id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  id v12 = [v10 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"r"];
  id v13 = +[_BSActionResponder action_decodeFromXPCObject:]((uint64_t)_BSActionResponder, v12);

  intptr_t v14 = (BSAction *)-[BSAction _initWithInfo:responder:](self, v11, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v11;
    id v5 = v4;
    info = self->_info;
    if (info) {
      [v4 encodeObject:info forKey:@"i"];
    }
    id v7 = -[_BSActionResponder action_encode:]((uint64_t)self->_responder, self);
    if (v7) {
      [v5 encodeXPCObject:v7 forKey:@"r"];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v9);
    id v10 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v10);
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@",
      v5,
      v7);
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  responder = self->_responder;
  id v8 = v10;
  if (!v10)
  {
    id v8 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 4uLL);
  }
  uint64_t v9 = -[_BSActionResponder action:sendResponse:]((uint64_t)responder, self, v8);
  if (!v10)
  {

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v6) {
LABEL_7:
  }
    v6[2](v6, v9);
LABEL_8:
}

- (BOOL)isValid
{
  return -[_BSActionResponder action_isValid]((os_unfair_lock_s *)self->_responder);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setNullificationHandler:(id)a3
{
}

- (BOOL)_expectsResponse
{
  responder = self->_responder;
  return !responder || !responder->_isOriginatorNull;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSAction *)a3;
  id v5 = v4;
  if (self == v4) {
    goto LABEL_11;
  }
  responder = self->_responder;
  if (!responder)
  {
LABEL_6:
    char v7 = 0;
    goto LABEL_12;
  }
  char v7 = 0;
  if (v4 && responder->_isOriginatorNull)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class()) {
      goto LABEL_6;
    }
    info = self->_info;
    id v10 = v5->_info;
    if (info != v10)
    {
      char v7 = 0;
      if (info && v10) {
        char v7 = -[BSSettings isEqual:](info, "isEqual:");
      }
      goto LABEL_12;
    }
LABEL_11:
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)[(BSAction *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = -[BSAction _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

@end