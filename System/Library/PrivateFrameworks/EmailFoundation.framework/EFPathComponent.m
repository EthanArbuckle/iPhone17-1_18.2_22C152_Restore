@interface EFPathComponent
+ (EFPathComponent)pathComponentWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (EFPathComponent)initWithString:(id)a3;
- (EFPathComponent)pathComponentByDeletingPathExtension;
- (NSString)pathExtension;
- (NSString)sanitizedString;
- (id)debugDescription;
- (id)description;
- (id)subpathToIndex:(unint64_t)a3;
- (uint64_t)_setSanitizedString:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_initWithSanitizedString:(void *)a1;
@end

@implementation EFPathComponent

+ (EFPathComponent)pathComponentWithString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v3];

  return (EFPathComponent *)v4;
}

- (EFPathComponent)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFPathComponent;
  v5 = [(EFPathComponent *)&v9 init];
  if (v5)
  {
    v6 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    char v7 = -[EFPathComponent _setSanitizedString:]((uint64_t)v5, v6);

    if ((v7 & 1) == 0)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)_setSanitizedString:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      uint64_t v5 = [v4 copy];
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_initWithSanitizedString:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)EFPathComponent;
    id v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      if ((-[EFPathComponent _setSanitizedString:]((uint64_t)v4, v3) & 1) == 0)
      {

        a1 = 0;
      }
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    sanitizedString = self->_sanitizedString;
    objc_super v6 = [v4 sanitizedString];
    char v7 = [(NSString *)sanitizedString isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_sanitizedString hash];
}

- (id)description
{
  return [(NSString *)self->_sanitizedString description];
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = [(NSString *)self->_sanitizedString debugDescription];
  uint64_t v5 = [v3 stringWithFormat:@"<EFPathComponent %p %@>", self, v4, 0];

  return v5;
}

- (unint64_t)length
{
  return [(NSString *)self->_sanitizedString length];
}

- (id)subpathToIndex:(unint64_t)a3
{
  uint64_t v5 = [EFPathComponent alloc];
  objc_super v6 = [(NSString *)self->_sanitizedString substringToIndex:a3];
  char v7 = -[EFPathComponent _initWithSanitizedString:](v5, v6);

  return v7;
}

- (NSString)pathExtension
{
  return [(NSString *)self->_sanitizedString pathExtension];
}

- (EFPathComponent)pathComponentByDeletingPathExtension
{
  id v3 = [EFPathComponent alloc];
  id v4 = [(NSString *)self->_sanitizedString stringByDeletingPathExtension];
  uint64_t v5 = -[EFPathComponent _initWithSanitizedString:](v3, v4);

  return (EFPathComponent *)v5;
}

- (NSString)sanitizedString
{
  return self->_sanitizedString;
}

- (void).cxx_destruct
{
}

@end