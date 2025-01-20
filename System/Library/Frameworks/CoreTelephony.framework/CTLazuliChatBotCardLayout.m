@interface CTLazuliChatBotCardLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCardLayout:(id)a3;
- (CTLazuliChatBotCardLayout)initWithCoder:(id)a3;
- (CTLazuliChatBotCardLayout)initWithReflection:(const void *)a3;
- (CTLazuliMessageChatBotCardStyle)cardStyle;
- (CTLazuliMessageChatBotDescriptionStyle)descriptionStyle;
- (CTLazuliMessageChatBotTitleStyle)titleStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cardOrientation;
- (int64_t)imageAlignment;
- (void)encodeWithCoder:(id)a3;
- (void)setCardOrientation:(int64_t)a3;
- (void)setCardStyle:(id)a3;
- (void)setDescriptionStyle:(id)a3;
- (void)setImageAlignment:(int64_t)a3;
- (void)setTitleStyle:(id)a3;
@end

@implementation CTLazuliChatBotCardLayout

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliChatBotCardLayout *)self cardOrientation];
  int64_t v10 = [(CTLazuliChatBotCardLayout *)self cardOrientation];
  [v3 appendFormat:@", cardOrientation = [%ld - %s]", v4, print_CTLazuliChatBotCardContentOrientationType(&v10)];
  int64_t v5 = [(CTLazuliChatBotCardLayout *)self imageAlignment];
  int64_t v10 = [(CTLazuliChatBotCardLayout *)self imageAlignment];
  [v3 appendFormat:@", imageAlignment = [%ld - %s]", v5, print_CTLazuliChatBotCardContentImageAlignmentType(&v10)];
  v6 = [(CTLazuliChatBotCardLayout *)self titleStyle];
  [v3 appendFormat:@", titleStyle = %@", v6];

  v7 = [(CTLazuliChatBotCardLayout *)self descriptionStyle];
  [v3 appendFormat:@", descriptionStyle = %@", v7];

  v8 = [(CTLazuliChatBotCardLayout *)self cardStyle];
  [v3 appendFormat:@", cardStyle = %@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardLayout:(id)a3
{
  id v7 = a3;
  int64_t v8 = [(CTLazuliChatBotCardLayout *)self cardOrientation];
  if (v8 != [v7 cardOrientation]
    || (int64_t v9 = [(CTLazuliChatBotCardLayout *)self imageAlignment],
        v9 != [v7 imageAlignment]))
  {
    char v11 = 0;
    goto LABEL_28;
  }
  int64_t v10 = [(CTLazuliChatBotCardLayout *)self titleStyle];
  if (!v10)
  {
    v22 = [v7 titleStyle];
    if (!v22)
    {
      v22 = 0;
      int v23 = 0;
      goto LABEL_10;
    }
  }
  v24 = [(CTLazuliChatBotCardLayout *)self titleStyle];
  v3 = [v7 titleStyle];
  if ([v24 isEqualToCTLazuliMessageChatBotTitleStyle:v3])
  {
    int v23 = 1;
LABEL_10:
    v12 = [(CTLazuliChatBotCardLayout *)self descriptionStyle];
    if (v12 || ([v7 descriptionStyle], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int64_t v4 = [(CTLazuliChatBotCardLayout *)self descriptionStyle];
      int64_t v5 = [v7 descriptionStyle];
      if (![v4 isEqualToCTLazuliMessageChatBotDescriptionStyle:v5])
      {
        char v11 = 0;
        goto LABEL_20;
      }
      int v21 = 1;
    }
    else
    {
      v20 = 0;
      int v21 = 0;
    }
    v13 = [(CTLazuliChatBotCardLayout *)self cardStyle];
    if (v13 || ([v7 cardStyle], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(CTLazuliChatBotCardLayout *)self cardStyle];
      v15 = [v7 cardStyle];
      char v11 = [v14 isEqualToCTLazuliMessageChatBotCardStyle:v15];

      if (v13)
      {

        if (!v21) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      v17 = v19;
    }
    else
    {
      v17 = 0;
      char v11 = 1;
    }

    if ((v21 & 1) == 0)
    {
LABEL_21:
      if (!v12) {

      }
      if (!v23) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_20:

    goto LABEL_21;
  }
  char v11 = 0;
LABEL_24:

LABEL_25:
  if (!v10) {

  }
LABEL_28:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTLazuliChatBotCardLayout *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCardLayout *)self isEqualToCTLazuliChatBotCardLayout:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CTLazuliChatBotCardLayout allocWithZone:a3];
  [(CTLazuliChatBotCardLayout *)v4 setCardOrientation:self->_cardOrientation];
  [(CTLazuliChatBotCardLayout *)v4 setImageAlignment:self->_imageAlignment];
  [(CTLazuliChatBotCardLayout *)v4 setTitleStyle:self->_titleStyle];
  [(CTLazuliChatBotCardLayout *)v4 setDescriptionStyle:self->_descriptionStyle];
  [(CTLazuliChatBotCardLayout *)v4 setCardStyle:self->_cardStyle];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  int64_t v4 = [NSNumber numberWithLong:self->_cardOrientation];
  [v6 encodeObject:v4 forKey:@"kCardOrientationKey"];

  int64_t v5 = [NSNumber numberWithLong:self->_imageAlignment];
  [v6 encodeObject:v5 forKey:@"kImageAlignmentKey"];

  [v6 encodeObject:self->_titleStyle forKey:@"kTitleStyleKey"];
  [v6 encodeObject:self->_descriptionStyle forKey:@"kDescriptionStyleKey"];
  [v6 encodeObject:self->_cardStyle forKey:@"kCardStyleKey"];
}

- (CTLazuliChatBotCardLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardLayout;
  int64_t v5 = [(CTLazuliChatBotCardLayout *)&v15 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCardOrientationKey"];
    v5->_cardOrientation = [v6 longValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kImageAlignmentKey"];
    v5->_imageAlignment = [v7 longValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleStyleKey"];
    titleStyle = v5->_titleStyle;
    v5->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDescriptionStyleKey"];
    descriptionStyle = v5->_descriptionStyle;
    v5->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCardStyleKey"];
    cardStyle = v5->_cardStyle;
    v5->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;
  }
  return v5;
}

- (CTLazuliChatBotCardLayout)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardLayout;
  id v4 = [(CTLazuliChatBotCardLayout *)&v15 init];
  if (!v4) {
    return v4;
  }
  v4->_cardOrientation = encode_CTLazuliGroupChatParticipantRoleType(a3);
  v4->_imageAlignment = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 1);
  if (*((unsigned char *)a3 + 11))
  {
    int64_t v5 = [CTLazuliMessageChatBotTitleStyle alloc];
    if (!*((unsigned char *)a3 + 11)) {
      goto LABEL_16;
    }
    uint64_t v6 = [(CTLazuliMessageChatBotTitleStyle *)v5 initWithReflection:(char *)a3 + 8];
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v6;
  }
  else
  {
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = 0;
  }

  if (*((unsigned char *)a3 + 15))
  {
    uint64_t v8 = [CTLazuliMessageChatBotDescriptionStyle alloc];
    if (!*((unsigned char *)a3 + 15)) {
      goto LABEL_16;
    }
    uint64_t v9 = [(CTLazuliMessageChatBotDescriptionStyle *)v8 initWithReflection:(char *)a3 + 12];
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v9;
  }
  else
  {
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = 0;
  }

  if (!*((unsigned char *)a3 + 40))
  {
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = 0;
    goto LABEL_14;
  }
  char v11 = [CTLazuliMessageChatBotCardStyle alloc];
  if (*((unsigned char *)a3 + 40))
  {
    uint64_t v12 = [(CTLazuliMessageChatBotCardStyle *)v11 initWithReflection:(char *)a3 + 16];
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;
LABEL_14:

    return v4;
  }
LABEL_16:
  result = (CTLazuliChatBotCardLayout *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)cardOrientation
{
  return self->_cardOrientation;
}

- (void)setCardOrientation:(int64_t)a3
{
  self->_cardOrientation = a3;
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
}

- (CTLazuliMessageChatBotTitleStyle)titleStyle
{
  return self->_titleStyle;
}

- (void)setTitleStyle:(id)a3
{
}

- (CTLazuliMessageChatBotDescriptionStyle)descriptionStyle
{
  return self->_descriptionStyle;
}

- (void)setDescriptionStyle:(id)a3
{
}

- (CTLazuliMessageChatBotCardStyle)cardStyle
{
  return self->_cardStyle;
}

- (void)setCardStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardStyle, 0);
  objc_storeStrong((id *)&self->_descriptionStyle, 0);

  objc_storeStrong((id *)&self->_titleStyle, 0);
}

@end