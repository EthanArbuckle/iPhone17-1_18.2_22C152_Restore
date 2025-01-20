@interface CTLazuliMessageChatBotCardCarouselLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliMessageChatBotCardCarouselLayout:(id)a3;
- (CTLazuliMessageChatBotCardCarouselLayout)initWithCoder:(id)a3;
- (CTLazuliMessageChatBotCardCarouselLayout)initWithReflection:(const void *)a3;
- (CTLazuliMessageChatBotCardStyle)cardStyle;
- (CTLazuliMessageChatBotDescriptionStyle)descriptionStyle;
- (CTLazuliMessageChatBotTitleStyle)titleStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)imageAlignment;
- (int64_t)orientation;
- (int64_t)width;
- (void)encodeWithCoder:(id)a3;
- (void)setCardStyle:(id)a3;
- (void)setDescriptionStyle:(id)a3;
- (void)setImageAlignment:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTitleStyle:(id)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation CTLazuliMessageChatBotCardCarouselLayout

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliMessageChatBotCardCarouselLayout *)self orientation];
  int64_t v11 = [(CTLazuliMessageChatBotCardCarouselLayout *)self orientation];
  [v3 appendFormat:@", orientation = [%ld - %s]", v4, print_CTLazuliChatBotCardContentOrientationType(&v11)];
  int64_t v5 = [(CTLazuliMessageChatBotCardCarouselLayout *)self imageAlignment];
  int64_t v11 = [(CTLazuliMessageChatBotCardCarouselLayout *)self imageAlignment];
  [v3 appendFormat:@", imageAlignment = [%ld - %s]", v5, print_CTLazuliChatBotCardContentImageAlignmentType(&v11)];
  int64_t v6 = [(CTLazuliMessageChatBotCardCarouselLayout *)self width];
  int64_t v11 = [(CTLazuliMessageChatBotCardCarouselLayout *)self width];
  [v3 appendFormat:@", width = [%ld - %s]", v6, print_CTLazuliChatBotCardCarouselWidthType(&v11)];
  v7 = [(CTLazuliMessageChatBotCardCarouselLayout *)self titleStyle];
  [v3 appendFormat:@", titleStyle = %@", v7];

  v8 = [(CTLazuliMessageChatBotCardCarouselLayout *)self descriptionStyle];
  [v3 appendFormat:@", descriptionStyle = %@", v8];

  v9 = [(CTLazuliMessageChatBotCardCarouselLayout *)self cardStyle];
  [v3 appendFormat:@", cardStyle = %@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliMessageChatBotCardCarouselLayout:(id)a3
{
  id v7 = a3;
  int64_t v8 = [(CTLazuliMessageChatBotCardCarouselLayout *)self orientation];
  if (v8 != [v7 orientation]
    || (int64_t v9 = [(CTLazuliMessageChatBotCardCarouselLayout *)self imageAlignment],
        v9 != [v7 imageAlignment])
    || (int64_t v10 = -[CTLazuliMessageChatBotCardCarouselLayout width](self, "width"), v10 != [v7 width]))
  {
    char v12 = 0;
    goto LABEL_9;
  }
  int64_t v11 = [(CTLazuliMessageChatBotCardCarouselLayout *)self titleStyle];
  if (!v11)
  {
    v23 = [v7 titleStyle];
    if (!v23)
    {
      v23 = 0;
      int v24 = 0;
      goto LABEL_12;
    }
  }
  v25 = [(CTLazuliMessageChatBotCardCarouselLayout *)self titleStyle];
  v3 = [v7 titleStyle];
  if ([v25 isEqualToCTLazuliMessageChatBotTitleStyle:v3])
  {
    int v24 = 1;
LABEL_12:
    v14 = [(CTLazuliMessageChatBotCardCarouselLayout *)self descriptionStyle];
    if (v14 || ([v7 descriptionStyle], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int64_t v4 = [(CTLazuliMessageChatBotCardCarouselLayout *)self descriptionStyle];
      int64_t v5 = [v7 descriptionStyle];
      if (![v4 isEqualToCTLazuliMessageChatBotDescriptionStyle:v5])
      {
        char v12 = 0;
        goto LABEL_22;
      }
      int v22 = 1;
    }
    else
    {
      v21 = 0;
      int v22 = 0;
    }
    v15 = [(CTLazuliMessageChatBotCardCarouselLayout *)self cardStyle];
    if (v15 || ([v7 cardStyle], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = [(CTLazuliMessageChatBotCardCarouselLayout *)self cardStyle];
      v17 = [v7 cardStyle];
      char v12 = [v16 isEqualToCTLazuliMessageChatBotCardStyle:v17];

      if (v15)
      {

        if (!v22) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      v18 = v20;
    }
    else
    {
      v18 = 0;
      char v12 = 1;
    }

    if ((v22 & 1) == 0)
    {
LABEL_23:
      if (!v14) {

      }
      if (!v24) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
LABEL_22:

    goto LABEL_23;
  }
  char v12 = 0;
LABEL_26:

LABEL_27:
  if (!v11) {

  }
LABEL_9:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTLazuliMessageChatBotCardCarouselLayout *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliMessageChatBotCardCarouselLayout *)self isEqualToCTLazuliMessageChatBotCardCarouselLayout:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[CTLazuliMessageChatBotCardCarouselLayout allocWithZone:a3];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setOrientation:self->_orientation];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setImageAlignment:self->_imageAlignment];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setWidth:self->_width];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setTitleStyle:self->_titleStyle];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setDescriptionStyle:self->_descriptionStyle];
  [(CTLazuliMessageChatBotCardCarouselLayout *)v4 setCardStyle:self->_cardStyle];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  int64_t v4 = [NSNumber numberWithLong:self->_orientation];
  [v7 encodeObject:v4 forKey:@"kOrientationKey"];

  int64_t v5 = [NSNumber numberWithLong:self->_imageAlignment];
  [v7 encodeObject:v5 forKey:@"kImageAlignmentKey"];

  BOOL v6 = [NSNumber numberWithLong:self->_width];
  [v7 encodeObject:v6 forKey:@"kWidthKey"];

  [v7 encodeObject:self->_titleStyle forKey:@"kTitleStyleKey"];
  [v7 encodeObject:self->_descriptionStyle forKey:@"kDescriptionStyleKey"];
  [v7 encodeObject:self->_cardStyle forKey:@"kCardStyleKey"];
}

- (CTLazuliMessageChatBotCardCarouselLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliMessageChatBotCardCarouselLayout;
  int64_t v5 = [(CTLazuliMessageChatBotCardCarouselLayout *)&v16 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOrientationKey"];
    v5->_orientation = [v6 longValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kImageAlignmentKey"];
    v5->_imageAlignment = [v7 longValue];

    int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kWidthKey"];
    v5->_width = [v8 longValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleStyleKey"];
    titleStyle = v5->_titleStyle;
    v5->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDescriptionStyleKey"];
    descriptionStyle = v5->_descriptionStyle;
    v5->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCardStyleKey"];
    cardStyle = v5->_cardStyle;
    v5->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v13;
  }
  return v5;
}

- (CTLazuliMessageChatBotCardCarouselLayout)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageChatBotCardCarouselLayout;
  id v4 = [(CTLazuliMessageChatBotCardCarouselLayout *)&v15 init];
  if (!v4) {
    return v4;
  }
  v4->_orientation = encode_CTLazuliGroupChatParticipantRoleType(a3);
  v4->_imageAlignment = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 1);
  v4->_width = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 2);
  if (*((unsigned char *)a3 + 15))
  {
    int64_t v5 = [CTLazuliMessageChatBotTitleStyle alloc];
    if (!*((unsigned char *)a3 + 15)) {
      goto LABEL_16;
    }
    uint64_t v6 = [(CTLazuliMessageChatBotTitleStyle *)v5 initWithReflection:(char *)a3 + 12];
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = (CTLazuliMessageChatBotTitleStyle *)v6;
  }
  else
  {
    titleStyle = v4->_titleStyle;
    v4->_titleStyle = 0;
  }

  if (*((unsigned char *)a3 + 19))
  {
    int64_t v8 = [CTLazuliMessageChatBotDescriptionStyle alloc];
    if (!*((unsigned char *)a3 + 19)) {
      goto LABEL_16;
    }
    uint64_t v9 = [(CTLazuliMessageChatBotDescriptionStyle *)v8 initWithReflection:(char *)a3 + 16];
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = (CTLazuliMessageChatBotDescriptionStyle *)v9;
  }
  else
  {
    descriptionStyle = v4->_descriptionStyle;
    v4->_descriptionStyle = 0;
  }

  if (!*((unsigned char *)a3 + 48))
  {
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [CTLazuliMessageChatBotCardStyle alloc];
  if (*((unsigned char *)a3 + 48))
  {
    uint64_t v12 = [(CTLazuliMessageChatBotCardStyle *)v11 initWithReflection:(char *)a3 + 24];
    cardStyle = v4->_cardStyle;
    v4->_cardStyle = (CTLazuliMessageChatBotCardStyle *)v12;
LABEL_14:

    return v4;
  }
LABEL_16:
  result = (CTLazuliMessageChatBotCardCarouselLayout *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->_imageAlignment = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
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