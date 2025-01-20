@interface BBContent
+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5;
+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 attributedMessage:(id)a6 summary:(id)a7;
+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 summary:(id)a6;
+ (BOOL)supportsSecureCoding;
- (BBContent)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContent:(id)a3;
- (NSAttributedString)attributedMessage;
- (NSAttributedString)summary;
- (NSString)message;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributedMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BBContent

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 attributedMessage:(id)a6 summary:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(BBContent);
  [(BBContent *)v16 setTitle:v15];

  [(BBContent *)v16 setSubtitle:v14];
  [(BBContent *)v16 setMessage:v13];

  [(BBContent *)v16 setAttributedMessage:v12];
  [(BBContent *)v16 setSummary:v11];

  return v16;
}

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 summary:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() contentWithTitle:v12 subtitle:v11 message:v10 attributedMessage:0 summary:v9];

  return (BBContent *)v13;
}

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() contentWithTitle:v9 subtitle:v8 message:v7 attributedMessage:0 summary:0];

  return (BBContent *)v10;
}

- (unint64_t)hash
{
  v3 = [(BBContent *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(BBContent *)self subtitle];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(BBContent *)self message];
  uint64_t v8 = [v7 hash];
  id v9 = [(BBContent *)self attributedMessage];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  id v11 = [(BBContent *)self summary];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BBContent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(BBContent *)self isEqualToContent:v4];
  }

  return v5;
}

- (BOOL)isEqualToContent:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEBUG)) {
    [(BBContent *)v5 isEqualToContent:v4];
  }
  uint64_t v6 = [(BBContent *)self title];
  id v7 = [v4 title];
  if (BSEqualObjects())
  {
    uint64_t v8 = [(BBContent *)self subtitle];
    id v9 = [v4 subtitle];
    if (BSEqualObjects())
    {
      uint64_t v10 = [(BBContent *)self message];
      id v11 = [v4 message];
      if (BSEqualObjects())
      {
        unint64_t v12 = [(BBContent *)self attributedMessage];
        id v13 = [v4 attributedMessage];
        if (BSEqualObjects())
        {
          v17 = [(BBContent *)self summary];
          [v4 summary];
          id v14 = v18 = v12;
          char v15 = BSEqualObjects();

          unint64_t v12 = v18;
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BBContent;
  BOOL v5 = [(BBContent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(BBContent *)v5 setTitle:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    [(BBContent *)v5 setSubtitle:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    [(BBContent *)v5 setMessage:v8];

    id v9 = (void *)MEMORY[0x263F086A0];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedMessage"];
    id v11 = objc_msgSend(v9, "_bb_attributedStringWithRTFDData:", v10);
    [(BBContent *)v5 setAttributedMessage:v11];

    unint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summary"];
    [(BBContent *)v5 setSummary:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BBContent *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(BBContent *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  id v7 = [(BBContent *)self message];
  [v4 encodeObject:v7 forKey:@"message"];

  uint64_t v8 = [(BBContent *)self attributedMessage];
  id v9 = objc_msgSend(v8, "_bb_RTFDData");
  [v4 encodeObject:v9 forKey:@"attributedMessage"];

  id v10 = [(BBContent *)self summary];
  [v4 encodeObject:v10 forKey:@"summary"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(BBContent *)self title];
  BOOL v5 = [(BBContent *)self subtitle];
  uint64_t v6 = [(BBContent *)self message];
  id v7 = [(BBContent *)self attributedMessage];
  uint64_t v8 = [(BBContent *)self summary];
  id v9 = [v3 stringWithFormat:@"{ title = '%@' : subtitle = '%@' : message = '%@' : attributedMessage = '%@', summary = '%@' }", v4, v5, v6, v7, v8];

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void)setAttributedMessage:(id)a3
{
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)isEqualToContent:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v5 = a1;
  uint64_t v6 = [a2 summary];
  id v7 = [a3 summary];
  int v8 = BSEqualObjects();
  id v9 = [a2 summary];
  id v10 = [v9 string];
  v11[0] = 67109378;
  v11[1] = v8;
  __int16 v12 = 2112;
  id v13 = v10;
  _os_log_debug_impl(&dword_217675000, v5, OS_LOG_TYPE_DEBUG, "KTH_DEBUG-isEqualToContent %d %@", (uint8_t *)v11, 0x12u);
}

@end