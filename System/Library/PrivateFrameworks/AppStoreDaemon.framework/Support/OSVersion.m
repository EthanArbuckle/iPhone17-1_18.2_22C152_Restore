@interface OSVersion
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)description;
@end

@implementation OSVersion

- (void)description
{
  v1 = a1;
  if (a1)
  {
    v2 = +[NSMutableString stringWithFormat:@"%lu", a1[1]];
    v3 = v2;
    if ((uint64_t)v1[2] > 0 || (uint64_t)v1[3] >= 1)
    {
      objc_msgSend(v2, "appendFormat:", @".%lu", v1[2]);
      if ((uint64_t)v1[3] >= 1) {
        objc_msgSend(v3, "appendFormat:", @".%lu", v1[3]);
      }
    }
    v1 = [v3 copy];
  }
  return v1;
}

- (unint64_t)hash
{
  return (self->_version.minor << 8) | (self->_version.major << 16) | self->_version.patch;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OSVersion *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self) {
        LOBYTE(self) = v5->_version.major == self->_version.major
      }
                    && v5->_version.minor == self->_version.minor
                    && v5->_version.patch == self->_version.patch;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

@end