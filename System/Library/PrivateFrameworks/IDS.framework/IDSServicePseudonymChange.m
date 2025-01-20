@interface IDSServicePseudonymChange
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPseudonymChange:(id)a3;
- (IDSPseudonym)pseudonym;
- (IDSServicePseudonymChange)initWithPseudonym:(id)a3 changeType:(unint64_t)a4 updateFlags:(int64_t)a5;
- (id)description;
- (int64_t)updateFlags;
- (unint64_t)changeType;
- (unint64_t)hash;
@end

@implementation IDSServicePseudonymChange

- (IDSServicePseudonymChange)initWithPseudonym:(id)a3 changeType:(unint64_t)a4 updateFlags:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSServicePseudonymChange;
  v10 = [(IDSServicePseudonymChange *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pseudonym, a3);
    v11->_changeType = a4;
    v11->_updateFlags = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t changeType = self->_changeType;
  if (changeType > 2) {
    v7 = @"Unknown";
  }
  else {
    v7 = off_1E572C8C8[changeType];
  }
  v8 = _IDSBinaryStringForValue();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p change: %@; updateFlags: %@; pseudonym: %@>",
    v5,
    self,
    v7,
    v8,
  id v9 = self->_pseudonym);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IDSServicePseudonymChange *)self isEqualToPseudonymChange:v4];

  return v5;
}

- (BOOL)isEqualToPseudonymChange:(id)a3
{
  id v4 = (IDSServicePseudonymChange *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    unint64_t v5 = [(IDSServicePseudonymChange *)self changeType];
    if (v5 == [(IDSServicePseudonymChange *)v4 changeType])
    {
      v6 = [(IDSServicePseudonymChange *)self pseudonym];
      v7 = [(IDSServicePseudonymChange *)v4 pseudonym];
      if ([v6 isEqualToPseudonym:v7])
      {
        int64_t v8 = [(IDSServicePseudonymChange *)self updateFlags];
        BOOL v9 = v8 == [(IDSServicePseudonymChange *)v4 updateFlags];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IDSServicePseudonymChange *)self changeType];
  id v4 = [(IDSServicePseudonymChange *)self pseudonym];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  return [(IDSServicePseudonymChange *)self updateFlags] - v5 + 32 * v5 + 29791;
}

- (IDSPseudonym)pseudonym
{
  return self->_pseudonym;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (int64_t)updateFlags
{
  return self->_updateFlags;
}

- (void).cxx_destruct
{
}

@end