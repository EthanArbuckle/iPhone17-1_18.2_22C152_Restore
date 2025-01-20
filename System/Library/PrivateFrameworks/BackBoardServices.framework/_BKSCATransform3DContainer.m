@interface _BKSCATransform3DContainer
+ (BOOL)supportsSecureCoding;
+ (id)protobufSchema;
- (CATransform3D)transform;
- (_BKSCATransform3DContainer)init;
- (_BKSCATransform3DContainer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTransform:(CATransform3D *)a3;
@end

@implementation _BKSCATransform3DContainer

- (void)setTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = v5;
  *(_OWORD *)&self->_transform.m13 = v4;
  *(_OWORD *)&self->_transform.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = v8;
  *(_OWORD *)&self->_transform.m33 = v7;
  *(_OWORD *)&self->_transform.m31 = v6;
}

- (CATransform3D)transform
{
  long long v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v12 = 0;
  long long v6 = [MEMORY[0x1E4F4F808] encodeObject:self error:&v12];
  id v7 = v12;
  if (!v6)
  {
    long long v8 = [NSString stringWithFormat:@"transform container encode error: %@", v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKSTouchEventService.m";
      __int16 v21 = 1024;
      int v22 = 93;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6A5DCLL);
  }
  [v5 encodeObject:v6 forKey:@"self"];
}

- (_BKSCATransform3DContainer)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"self"];

  if (!v5)
  {
    id v7 = BKLogEventDelivery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_ERROR, "transform container data decode failure", buf, 2u);
    }
    goto LABEL_8;
  }
  id v10 = 0;
  long long v6 = [MEMORY[0x1E4F4F808] decodeObjectOfClass:objc_opt_class() fromData:v5 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    long long v8 = BKLogEventDelivery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_error_impl(&dword_18AA0B000, v8, OS_LOG_TYPE_ERROR, "transform container protobuf decode failure: %{public}@", buf, 0xCu);
    }

LABEL_8:
    long long v6 = 0;
  }

  return v6;
}

- (_BKSCATransform3DContainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)_BKSCATransform3DContainer;
  result = [(_BKSCATransform3DContainer *)&v3 init];
  if (result)
  {
    result->_transform.m11 = 1.0;
    *(_OWORD *)&result->_transform.m12 = 0u;
    *(_OWORD *)&result->_transform.m14 = 0u;
    result->_transform.m22 = 1.0;
    *(_OWORD *)&result->_transform.m23 = 0u;
    *(_OWORD *)&result->_transform.m31 = 0u;
    result->_transform.m33 = 1.0;
    *(_OWORD *)&result->_transform.m34 = 0u;
    *(_OWORD *)&result->_transform.m42 = 0u;
    result->_transform.m44 = 1.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___BKSCATransform3DContainer_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_11357 != -1) {
    dispatch_once(&protobufSchema_onceToken_11357, block);
  }
  v2 = (void *)protobufSchema_schema_11358;
  return v2;
}

@end