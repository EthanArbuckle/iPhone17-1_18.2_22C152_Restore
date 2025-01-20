@interface CTLazuliChatBotCardContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCardContent:(id)a3;
- (CTLazuliChatBotCardContent)initWithCoder:(id)a3;
- (CTLazuliChatBotCardContent)initWithReflection:(const void *)a3;
- (CTLazuliChatBotCardDescription)cardDescription;
- (CTLazuliChatBotCardMedia)media;
- (CTLazuliChatBotCardTitle)title;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCardDescription:(id)a3;
- (void)setChipList:(id)a3;
- (void)setMedia:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CTLazuliChatBotCardContent

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCardContent *)self media];
  [v3 appendFormat:@", media = %@", v4];

  v5 = [(CTLazuliChatBotCardContent *)self title];
  [v3 appendFormat:@", title = %@", v5];

  v6 = [(CTLazuliChatBotCardContent *)self cardDescription];
  [v3 appendFormat:@", cardDescription = %@", v6];

  v7 = [(CTLazuliChatBotCardContent *)self chipList];
  [v3 appendFormat:@", chipList = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardContent:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliChatBotCardContent *)self media];
  if (v7 || ([v6 media], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliChatBotCardContent *)self media];
    v4 = [v6 media];
    if (([v3 isEqualToCTLazuliChatBotCardMedia:v4] & 1) == 0)
    {

      char v8 = 0;
      goto LABEL_36;
    }
    int v25 = 1;
  }
  else
  {
    v23 = 0;
    int v25 = 0;
  }
  v9 = [(CTLazuliChatBotCardContent *)self title];
  if (v9 || ([v6 title], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v26 = [(CTLazuliChatBotCardContent *)self title];
    v24 = [v6 title];
    if ((objc_msgSend(v26, "isEqualToCTLazuliChatBotCardTitle:") & 1) == 0)
    {

      if (v9) {
      else
      }

      char v8 = 0;
      if ((v25 & 1) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    int v21 = 1;
  }
  else
  {
    v19 = 0;
    int v21 = 0;
  }
  v10 = [(CTLazuliChatBotCardContent *)self cardDescription];
  if (v10 || ([v6 cardDescription], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = [(CTLazuliChatBotCardContent *)self cardDescription];
    v20 = [v6 cardDescription];
    if (!objc_msgSend(v22, "isEqualToCTLazuliChatBotCardDescription:"))
    {
      char v8 = 0;
      goto LABEL_27;
    }
    int v18 = 1;
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  v11 = [(CTLazuliChatBotCardContent *)self chipList];
  if (v11 || ([v6 chipList], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(CTLazuliChatBotCardContent *)self chipList];
    v13 = [v6 chipList];
    char v8 = [v12 isEqualToCTLazuliChatBotSuggestedChipList:v13];

    if (v11)
    {

      if (!v18) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    char v8 = 1;
  }

  if (v18)
  {
LABEL_27:
  }
LABEL_28:
  if (!v10) {

  }
  if (v21)
  {
  }
  if (!v9) {

  }
  if (v25)
  {
LABEL_35:
  }
LABEL_36:
  if (!v7) {

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotCardContent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCardContent *)self isEqualToCTLazuliChatBotCardContent:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotCardContent allocWithZone:a3];
  [(CTLazuliChatBotCardContent *)v4 setMedia:self->_media];
  [(CTLazuliChatBotCardContent *)v4 setTitle:self->_title];
  [(CTLazuliChatBotCardContent *)v4 setCardDescription:self->_cardDescription];
  [(CTLazuliChatBotCardContent *)v4 setChipList:self->_chipList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_media forKey:@"kMediaKey"];
  [v4 encodeObject:self->_title forKey:@"kTitleKey"];
  [v4 encodeObject:self->_cardDescription forKey:@"kCardDescriptionKey"];
  [v4 encodeObject:self->_chipList forKey:@"kChipListKey"];
}

- (CTLazuliChatBotCardContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotCardContent;
  v5 = [(CTLazuliChatBotCardContent *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaKey"];
    media = v5->_media;
    v5->_media = (CTLazuliChatBotCardMedia *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleKey"];
    title = v5->_title;
    v5->_title = (CTLazuliChatBotCardTitle *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCardDescriptionKey"];
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = (CTLazuliChatBotCardDescription *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v12;
  }
  return v5;
}

- (CTLazuliChatBotCardContent)initWithReflection:(const void *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CTLazuliChatBotCardContent;
  id v4 = [(CTLazuliChatBotCardContent *)&v19 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (*((unsigned char *)a3 + 176))
  {
    uint64_t v6 = [CTLazuliChatBotCardMedia alloc];
    if (!*((unsigned char *)a3 + 176)) {
      goto LABEL_20;
    }
    uint64_t v7 = [(CTLazuliChatBotCardMedia *)v6 initWithReflection:a3];
    media = v5->_media;
    v5->_media = (CTLazuliChatBotCardMedia *)v7;
  }
  else
  {
    media = v4->_media;
    v4->_media = 0;
  }

  if (*((unsigned char *)a3 + 208))
  {
    v9 = [CTLazuliChatBotCardTitle alloc];
    if (!*((unsigned char *)a3 + 208)) {
      goto LABEL_20;
    }
    uint64_t v10 = [(CTLazuliChatBotCardTitle *)v9 initWithReflection:(char *)a3 + 184];
    title = v5->_title;
    v5->_title = (CTLazuliChatBotCardTitle *)v10;
  }
  else
  {
    title = v5->_title;
    v5->_title = 0;
  }

  if (*((unsigned char *)a3 + 240))
  {
    uint64_t v12 = [CTLazuliChatBotCardDescription alloc];
    if (!*((unsigned char *)a3 + 240)) {
      goto LABEL_20;
    }
    uint64_t v13 = [(CTLazuliChatBotCardDescription *)v12 initWithReflection:(char *)a3 + 216];
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = (CTLazuliChatBotCardDescription *)v13;
  }
  else
  {
    cardDescription = v5->_cardDescription;
    v5->_cardDescription = 0;
  }

  if (!*((unsigned char *)a3 + 272))
  {
    chipList = v5->_chipList;
    v5->_chipList = 0;
    goto LABEL_18;
  }
  objc_super v15 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((unsigned char *)a3 + 272))
  {
    uint64_t v16 = [(CTLazuliChatBotSuggestedChipList *)v15 initWithReflection:(char *)a3 + 248];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v16;
LABEL_18:

    return v5;
  }
LABEL_20:
  result = (CTLazuliChatBotCardContent *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotCardMedia)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
}

- (CTLazuliChatBotCardTitle)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (CTLazuliChatBotCardDescription)cardDescription
{
  return self->_cardDescription;
}

- (void)setCardDescription:(id)a3
{
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipList, 0);
  objc_storeStrong((id *)&self->_cardDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_media, 0);
}

@end