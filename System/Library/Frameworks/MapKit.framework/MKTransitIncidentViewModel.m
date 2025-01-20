@interface MKTransitIncidentViewModel
- (BOOL)isBlocking;
- (BOOL)isEqual:(id)a3;
- (BOOL)showImage;
- (NSString)message;
- (NSString)symbolName;
- (UIColor)backgroundColor;
- (UIColor)symbolColor;
- (void)setBlocking:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setShowImage:(BOOL)a3;
@end

@implementation MKTransitIncidentViewModel

- (UIColor)backgroundColor
{
  if ([(MKTransitIncidentViewModel *)self isBlocking])
  {
    v2 = [MEMORY[0x1E4F428B8] systemRedColor];
    v3 = v2;
    double v4 = 0.150000006;
  }
  else
  {
    v2 = [MEMORY[0x1E4F428B8] systemYellowColor];
    v3 = v2;
    double v4 = 0.200000003;
  }
  v5 = [v2 colorWithAlphaComponent:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F428B8]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__MKTransitIncidentViewModel_backgroundColor__block_invoke;
  v10[3] = &unk_1E54BBF10;
  id v11 = v5;
  id v7 = v5;
  v8 = (void *)[v6 initWithDynamicProvider:v10];

  return (UIColor *)v8;
}

id __45__MKTransitIncidentViewModel_backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    id v3 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
  }
  else
  {
    id v3 = *(id *)(a1 + 32);
  }

  return v3;
}

- (NSString)symbolName
{
  if (![(MKTransitIncidentViewModel *)self showImage]) {
    return 0;
  }
  if (MapKitIdiomIsMacCatalyst()) {
    return (NSString *)@"info.circle.fill";
  }
  if ([(MKTransitIncidentViewModel *)self isBlocking]) {
    return (NSString *)@"minus.circle.fill";
  }
  return (NSString *)@"exclamationmark.circle.fill";
}

- (UIColor)symbolColor
{
  if ([(MKTransitIncidentViewModel *)self isBlocking]) {
    [MEMORY[0x1E4F428B8] systemRedColor];
  }
  else {
  v2 = [MEMORY[0x1E4F428B8] systemYellowColor];
  }

  return (UIColor *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MKTransitIncidentViewModel *)self symbolName];
    id v7 = [v5 symbolName];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
    {
      LOBYTE(v17) = 0;
    }
    else
    {
      id v11 = [(MKTransitIncidentViewModel *)self message];
      v12 = [v5 message];
      unint64_t v13 = v11;
      unint64_t v14 = v12;
      if ((!(v13 | v14)
         || (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, v15))
        && (int v16 = [(MKTransitIncidentViewModel *)self isBlocking],
            v16 == [v5 isBlocking]))
      {
        BOOL v18 = [(MKTransitIncidentViewModel *)self showImage];
        int v17 = v18 ^ [v5 showImage] ^ 1;
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)isBlocking
{
  return self->_blocking;
}

- (void)setBlocking:(BOOL)a3
{
  self->_blocking = a3;
}

- (BOOL)showImage
{
  return self->_showImage;
}

- (void)setShowImage:(BOOL)a3
{
  self->_showImage = a3;
}

- (void).cxx_destruct
{
}

@end