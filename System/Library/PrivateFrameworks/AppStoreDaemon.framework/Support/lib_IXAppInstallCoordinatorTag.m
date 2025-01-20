@interface lib_IXAppInstallCoordinatorTag
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation lib_IXAppInstallCoordinatorTag

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> { coordinatorID = %@; bundleID = %@ }",
    v4,
    self,
    self->_coordinatorID,
  v5 = self->_bundleID);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (lib_IXAppInstallCoordinatorTag *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self)
      {
        bundleID = self->_bundleID;
        v7 = v5->_bundleID;
        if (bundleID == v7) {
          goto LABEL_8;
        }
        unsigned __int8 v8 = 0;
        if (!bundleID || !v7)
        {
LABEL_16:

          goto LABEL_17;
        }
        if (-[NSString isEqual:](bundleID, "isEqual:"))
        {
LABEL_8:
          coordinatorID = self->_coordinatorID;
          v10 = v5->_coordinatorID;
          if (coordinatorID == v10)
          {
            unsigned __int8 v8 = 1;
          }
          else
          {
            unsigned __int8 v8 = 0;
            if (coordinatorID && v10) {
              unsigned __int8 v8 = -[NSUUID isEqual:](coordinatorID, "isEqual:");
            }
          }
          goto LABEL_16;
        }
      }
      unsigned __int8 v8 = 0;
      goto LABEL_16;
    }
    unsigned __int8 v8 = 0;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleID hash];
  return (unint64_t)[(NSUUID *)self->_coordinatorID hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end