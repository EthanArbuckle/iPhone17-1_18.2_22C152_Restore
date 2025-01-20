@interface CatacombComponent
+ (id)component:(id *)a3;
+ (id)componentForUserID:(unsigned int)a3;
+ (id)masterComponent;
- ($7287BE6C16BD8CBBAFC45DEB4D81687E)group;
- ($EA2F7D24101002CF4BECDFD08DC3BA5A)component;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToComponent:(id)a3;
- (BOOL)isGroupComponent;
- (BOOL)isMasterComponent;
- (BOOL)isUserComponent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)userID;
@end

@implementation CatacombComponent

+ (id)masterComponent
{
  return +[CatacombComponent componentForUserID:0xFFFFFFFFLL];
}

+ (id)componentForUserID:(unsigned int)a3
{
  v4 = objc_alloc_init(CatacombComponent);
  if (v4)
  {
    v4->_component.userID = a3;
    v4->_component.group.type = 0;
  }
  return v4;
}

- ($EA2F7D24101002CF4BECDFD08DC3BA5A)component
{
  return ($EA2F7D24101002CF4BECDFD08DC3BA5A *)&self->_component;
}

- (unsigned)userID
{
  return self->_component.userID;
}

- (BOOL)isEqualToComponent:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = (void *)[a3 component];
  return *(void *)&self->_component.userID == *v4
      && *(void *)self->_component.group.uuid == v4[1]
      && *(void *)&self->_component.group.uuid[8] == v4[2];
}

- (BOOL)isMasterComponent
{
  return self->_component.userID == -1;
}

- (BOOL)isUserComponent
{
  return self->_component.userID != -1 && self->_component.group.type == 0;
}

- (id)description
{
  if (self->_component.userID == -1)
  {
    v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v14);
    [v13 stringWithFormat:@"<%@: %p:(Master)>", v7, self, v16];
  }
  else
  {
    unsigned int type = self->_component.group.type;
    v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v7 = (void *)v6;
    uint64_t userID = self->_component.userID;
    if (type)
    {
      uint64_t v9 = self->_component.group.type;
      v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:self->_component.group.uuid];
      v11 = [v10 UUIDString];
      v12 = [v4 stringWithFormat:@"<%@: %p:(Group userID:%u, type:%u, uuid:%@)>", v7, self, userID, v9, v11];

      goto LABEL_7;
    }
    [v4 stringWithFormat:@"<%@: %p:(User userID:%u)>", v6, self, userID];
  v12 = };
LABEL_7:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(CatacombComponent);
  if (result)
  {
    long long v5 = *(_OWORD *)&self->_component.userID;
    *((void *)result + 3) = *(void *)&self->_component.group.uuid[8];
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_component.userID;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CatacombComponent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CatacombComponent *)self isEqualToComponent:v4];
  }

  return v5;
}

+ (id)component:(id *)a3
{
  if (a3)
  {
    BOOL v5 = objc_alloc_init(CatacombComponent);
    if (v5)
    {
      long long v6 = *(_OWORD *)&a3->var0;
      *(void *)&v5->_component.group.uuid[8] = *(void *)&a3->var1.var1[8];
      *(_OWORD *)&v5->_component.uint64_t userID = v6;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)group
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)&self->_component.group;
}

- (BOOL)isGroupComponent
{
  return self->_component.userID != -1 && self->_component.group.type != 0;
}

@end