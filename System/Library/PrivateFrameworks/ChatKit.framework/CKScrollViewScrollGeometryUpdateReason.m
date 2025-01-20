@interface CKScrollViewScrollGeometryUpdateReason
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUpdateReason:(id)a3;
- (CKScrollViewAnimationProperties)animationProperties;
- (CKScrollViewScrollGeometryUpdateReason)initWithReasonType:(id)a3 animationProperties:(id)a4;
- (NSString)reasonType;
- (id)description;
- (unint64_t)hash;
- (void)setAnimationProperties:(id)a3;
- (void)setReasonType:(id)a3;
@end

@implementation CKScrollViewScrollGeometryUpdateReason

- (CKScrollViewScrollGeometryUpdateReason)initWithReasonType:(id)a3 animationProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKScrollViewScrollGeometryUpdateReason;
  v9 = [(CKScrollViewScrollGeometryUpdateReason *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reasonType, a3);
    objc_storeStrong((id *)&v10->_animationProperties, a4);
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ScrollGeometryUpdate, type=%@, animation=%@>", self->_reasonType, self->_animationProperties];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_reasonType hash];
  return [(CKScrollViewAnimationProperties *)self->_animationProperties hash] ^ v3;
}

- (BOOL)isEqualToUpdateReason:(id)a3
{
  v4 = a3;
  if ([(NSString *)self->_reasonType isEqualToString:v4[1]]) {
    BOOL v5 = [(CKScrollViewAnimationProperties *)self->_animationProperties isEqual:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CKScrollViewScrollGeometryUpdateReason *)self isEqualToUpdateReason:v4];

  return v5;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
}

- (CKScrollViewAnimationProperties)animationProperties
{
  return self->_animationProperties;
}

- (void)setAnimationProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationProperties, 0);

  objc_storeStrong((id *)&self->_reasonType, 0);
}

@end