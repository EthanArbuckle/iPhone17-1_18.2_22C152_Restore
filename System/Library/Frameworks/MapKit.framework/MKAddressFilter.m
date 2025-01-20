@interface MKAddressFilter
+ (BOOL)supportsSecureCoding;
+ (MKAddressFilter)filterExcludingAll;
+ (MKAddressFilter)filterIncludingAll;
- (BOOL)excludesOptions:(unint64_t)a3;
- (BOOL)includesOptions:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddressFilter:(id)a3;
- (MKAddressFilter)init;
- (MKAddressFilter)initWithCoder:(id)a3;
- (id)_commaSeparatedListOfOptions:(unint64_t)a3;
- (id)_geoAddressFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initExcludingOptions:(unint64_t)a3;
- (id)initIncludingOptions:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKAddressFilter

+ (MKAddressFilter)filterIncludingAll
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initIncludingOptions:-1];

  return (MKAddressFilter *)v2;
}

+ (MKAddressFilter)filterExcludingAll
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initExcludingOptions:-1];

  return (MKAddressFilter *)v2;
}

- (MKAddressFilter)init
{
  return (MKAddressFilter *)[(MKAddressFilter *)self initIncludingOptions:-1];
}

- (id)initIncludingOptions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKAddressFilter;
  id result = [(MKAddressFilter *)&v7 init];
  if (result)
  {
    uint64_t v5 = 8;
    if (a3)
    {
      unint64_t v6 = a3;
    }
    else
    {
      uint64_t v5 = 16;
      unint64_t v6 = -1;
    }
    *(void *)((char *)result + v5) = v6;
  }
  return result;
}

- (id)initExcludingOptions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKAddressFilter;
  id result = [(MKAddressFilter *)&v7 init];
  if (result)
  {
    uint64_t v5 = 16;
    if (a3)
    {
      unint64_t v6 = a3;
    }
    else
    {
      uint64_t v5 = 8;
      unint64_t v6 = -1;
    }
    *(void *)((char *)result + v5) = v6;
  }
  return result;
}

- (BOOL)includesOptions:(unint64_t)a3
{
  unint64_t includedOptions = self->_includedOptions;
  if (includedOptions) {
    return (a3 & ~includedOptions) == 0;
  }
  else {
    return (a3 & ~self->_excludedOptions) != 0;
  }
}

- (BOOL)excludesOptions:(unint64_t)a3
{
  unint64_t excludedOptions = self->_excludedOptions;
  if (excludedOptions) {
    return (a3 & ~excludedOptions) == 0;
  }
  else {
    return (a3 & ~self->_includedOptions) != 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t includedOptions = self->_includedOptions;
  id v5 = a3;
  [v5 encodeInt64:includedOptions forKey:@"inclusions"];
  [v5 encodeInt64:self->_excludedOptions forKey:@"exclusions"];
}

- (MKAddressFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"inclusions"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"exclusions"];

  if (v5 | v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)MKAddressFilter;
    v8 = [(MKAddressFilter *)&v12 init];
    if (v8)
    {
      if (v5) {
        v9 = (objc_class *)v5;
      }
      else {
        v9 = (objc_class *)v6;
      }
      uint64_t v10 = 8;
      if (!v5) {
        uint64_t v10 = 16;
      }
      *(Class *)((char *)&v8->super.isa + v10) = v9;
    }
    self = v8;
    objc_super v7 = self;
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_includedOptions;
  *((void *)result + 2) = self->_excludedOptions;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MKAddressFilter *)self isEqualToAddressFilter:v4];

  return v5;
}

- (BOOL)isEqualToAddressFilter:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4 && self->_includedOptions == v4[1] && self->_excludedOptions == v4[2];

  return v5;
}

- (id)description
{
  unint64_t includedOptions = self->_includedOptions;
  if (includedOptions == -1)
  {
    objc_super v7 = @"Include: All";
  }
  else if (self->_excludedOptions == -1)
  {
    objc_super v7 = @"Exclude: All";
  }
  else
  {
    id v4 = [NSString alloc];
    if (includedOptions)
    {
      BOOL v5 = [(MKAddressFilter *)self _commaSeparatedListOfOptions:self->_includedOptions];
      uint64_t v6 = [v4 initWithFormat:@"Include: %@", v5];
    }
    else
    {
      BOOL v5 = [(MKAddressFilter *)self _commaSeparatedListOfOptions:self->_excludedOptions];
      uint64_t v6 = [v4 initWithFormat:@"Exclude: %@", v5];
    }
    objc_super v7 = (__CFString *)v6;
  }
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"%@: %p %@", v10, self, v7];

  return v11;
}

- (id)_commaSeparatedListOfOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  BOOL v5 = v4;
  if (v3)
  {
    [v4 appendString:@"Country, "];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 appendString:@"Administrative Area, "];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v5 appendString:@"Subadministrative Area, "];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v5 appendString:@"Locality, "];
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  [v5 appendString:@"Sublocality, "];
  if ((v3 & 0x20) != 0) {
LABEL_7:
  }
    [v5 appendString:@"Postal Code, "];
LABEL_8:
  if ((unint64_t)[v5 length] >= 3) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 2, 2, &stru_1ED919588);
  }

  return v5;
}

- (id)_geoAddressFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F643B8]) initWithOptionsToInclude:self->_includedOptions optionsToExclude:self->_excludedOptions];

  return v2;
}

@end