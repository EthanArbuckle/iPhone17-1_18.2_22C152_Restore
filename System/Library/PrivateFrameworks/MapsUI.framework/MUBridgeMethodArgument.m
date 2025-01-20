@interface MUBridgeMethodArgument
- (BOOL)hasArtworkArgument;
- (BOOL)hasAttributionArgument;
- (BOOL)hasIconArgument;
- (BOOL)hasPageResizedArgument;
- (BOOL)hasType;
- (BOOL)hasUserInteractionAction;
- (BOOL)hasWebMenuButton;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MUAmpArtworkArgument)artworkArgument;
- (MUAttributionArgument)attributionArgument;
- (MUIconArgument)iconArgument;
- (MUPageResizedArgument)pageResizedArgument;
- (MUUserInteractionAction)userInteractionAction;
- (MUWebMenuButton)webMenuButton;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkArgument:(id)a3;
- (void)setAttributionArgument:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIconArgument:(id)a3;
- (void)setPageResizedArgument:(id)a3;
- (void)setType:(int)a3;
- (void)setUserInteractionAction:(id)a3;
- (void)setWebMenuButton:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUBridgeMethodArgument

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"UI_MENU_BUTTON_ARGUMENTS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"USER_INTERACTION_ARGUMENTS";
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_INTERACTION_ARGUMENTS"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"UI_MENU_BUTTON_ARGUMENTS"];
  }

  return v4;
}

- (BOOL)hasIconArgument
{
  return self->_iconArgument != 0;
}

- (BOOL)hasAttributionArgument
{
  return self->_attributionArgument != 0;
}

- (BOOL)hasArtworkArgument
{
  return self->_artworkArgument != 0;
}

- (BOOL)hasUserInteractionAction
{
  return self->_userInteractionAction != 0;
}

- (BOOL)hasWebMenuButton
{
  return self->_webMenuButton != 0;
}

- (BOOL)hasPageResizedArgument
{
  return self->_pageResizedArgument != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUBridgeMethodArgument;
  int v4 = [(MUBridgeMethodArgument *)&v8 description];
  v5 = [(MUBridgeMethodArgument *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        v5 = @"UI_MENU_BUTTON_ARGUMENTS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"USER_INTERACTION_ARGUMENTS";
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  iconArgument = self->_iconArgument;
  if (iconArgument)
  {
    v7 = [(MUIconArgument *)iconArgument dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"icon_argument"];
  }
  attributionArgument = self->_attributionArgument;
  if (attributionArgument)
  {
    v9 = [(MUAttributionArgument *)attributionArgument dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"attribution_argument"];
  }
  artworkArgument = self->_artworkArgument;
  if (artworkArgument)
  {
    v11 = [(MUAmpArtworkArgument *)artworkArgument dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"artwork_argument"];
  }
  userInteractionAction = self->_userInteractionAction;
  if (userInteractionAction)
  {
    v13 = [(MUUserInteractionAction *)userInteractionAction dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"user_interaction_action"];
  }
  webMenuButton = self->_webMenuButton;
  if (webMenuButton)
  {
    v15 = [(MUWebMenuButton *)webMenuButton dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"web_menu_button"];
  }
  pageResizedArgument = self->_pageResizedArgument;
  if (pageResizedArgument)
  {
    v17 = [(MUPageResizedArgument *)pageResizedArgument dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"page_resized_argument"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUBridgeMethodArgumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_iconArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_attributionArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_artworkArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userInteractionAction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_webMenuButton)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pageResizedArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v5 = v4;
  if (self->_iconArgument)
  {
    objc_msgSend(v4, "setIconArgument:");
    id v4 = v5;
  }
  if (self->_attributionArgument)
  {
    objc_msgSend(v5, "setAttributionArgument:");
    id v4 = v5;
  }
  if (self->_artworkArgument)
  {
    objc_msgSend(v5, "setArtworkArgument:");
    id v4 = v5;
  }
  if (self->_userInteractionAction)
  {
    objc_msgSend(v5, "setUserInteractionAction:");
    id v4 = v5;
  }
  if (self->_webMenuButton)
  {
    objc_msgSend(v5, "setWebMenuButton:");
    id v4 = v5;
  }
  if (self->_pageResizedArgument)
  {
    objc_msgSend(v5, "setPageResizedArgument:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v7 = [(MUIconArgument *)self->_iconArgument copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(MUAttributionArgument *)self->_attributionArgument copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(MUAmpArtworkArgument *)self->_artworkArgument copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(MUUserInteractionAction *)self->_userInteractionAction copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(MUWebMenuButton *)self->_webMenuButton copyWithZone:a3];
  v16 = (void *)v6[7];
  v6[7] = v15;

  id v17 = [(MUPageResizedArgument *)self->_pageResizedArgument copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  iconArgument = self->_iconArgument;
  if ((unint64_t)iconArgument | *((void *)v4 + 3) && !-[MUIconArgument isEqual:](iconArgument, "isEqual:")) {
    goto LABEL_19;
  }
  attributionArgument = self->_attributionArgument;
  if ((unint64_t)attributionArgument | *((void *)v4 + 2))
  {
    if (!-[MUAttributionArgument isEqual:](attributionArgument, "isEqual:")) {
      goto LABEL_19;
    }
  }
  artworkArgument = self->_artworkArgument;
  if ((unint64_t)artworkArgument | *((void *)v4 + 1))
  {
    if (!-[MUAmpArtworkArgument isEqual:](artworkArgument, "isEqual:")) {
      goto LABEL_19;
    }
  }
  userInteractionAction = self->_userInteractionAction;
  if ((unint64_t)userInteractionAction | *((void *)v4 + 6))
  {
    if (!-[MUUserInteractionAction isEqual:](userInteractionAction, "isEqual:")) {
      goto LABEL_19;
    }
  }
  webMenuButton = self->_webMenuButton;
  if ((unint64_t)webMenuButton | *((void *)v4 + 7))
  {
    if (!-[MUWebMenuButton isEqual:](webMenuButton, "isEqual:")) {
      goto LABEL_19;
    }
  }
  pageResizedArgument = self->_pageResizedArgument;
  if ((unint64_t)pageResizedArgument | *((void *)v4 + 4)) {
    char v11 = -[MUPageResizedArgument isEqual:](pageResizedArgument, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MUIconArgument *)self->_iconArgument hash] ^ v3;
  unint64_t v5 = [(MUAttributionArgument *)self->_attributionArgument hash];
  unint64_t v6 = v4 ^ v5 ^ [(MUAmpArtworkArgument *)self->_artworkArgument hash];
  unint64_t v7 = [(MUUserInteractionAction *)self->_userInteractionAction hash];
  unint64_t v8 = v7 ^ [(MUWebMenuButton *)self->_webMenuButton hash];
  return v6 ^ v8 ^ [(MUPageResizedArgument *)self->_pageResizedArgument hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 64))
  {
    self->_int type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  iconArgument = self->_iconArgument;
  uint64_t v7 = v5[3];
  v18 = v5;
  if (iconArgument)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MUIconArgument mergeFrom:](iconArgument, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MUBridgeMethodArgument setIconArgument:](self, "setIconArgument:");
  }
  unint64_t v5 = v18;
LABEL_9:
  attributionArgument = self->_attributionArgument;
  uint64_t v9 = v5[2];
  if (attributionArgument)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MUAttributionArgument mergeFrom:](attributionArgument, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MUBridgeMethodArgument setAttributionArgument:](self, "setAttributionArgument:");
  }
  unint64_t v5 = v18;
LABEL_15:
  artworkArgument = self->_artworkArgument;
  uint64_t v11 = v5[1];
  if (artworkArgument)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MUAmpArtworkArgument mergeFrom:](artworkArgument, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MUBridgeMethodArgument setArtworkArgument:](self, "setArtworkArgument:");
  }
  unint64_t v5 = v18;
LABEL_21:
  userInteractionAction = self->_userInteractionAction;
  uint64_t v13 = v5[6];
  if (userInteractionAction)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MUUserInteractionAction mergeFrom:](userInteractionAction, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[MUBridgeMethodArgument setUserInteractionAction:](self, "setUserInteractionAction:");
  }
  unint64_t v5 = v18;
LABEL_27:
  webMenuButton = self->_webMenuButton;
  uint64_t v15 = v5[7];
  if (webMenuButton)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MUWebMenuButton mergeFrom:](webMenuButton, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[MUBridgeMethodArgument setWebMenuButton:](self, "setWebMenuButton:");
  }
  unint64_t v5 = v18;
LABEL_33:
  pageResizedArgument = self->_pageResizedArgument;
  uint64_t v17 = v5[4];
  if (pageResizedArgument)
  {
    if (!v17) {
      goto LABEL_39;
    }
    pageResizedArgument = (MUPageResizedArgument *)-[MUPageResizedArgument mergeFrom:](pageResizedArgument, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_39;
    }
    pageResizedArgument = (MUPageResizedArgument *)-[MUBridgeMethodArgument setPageResizedArgument:](self, "setPageResizedArgument:");
  }
  unint64_t v5 = v18;
LABEL_39:
  MEMORY[0x1F41817F8](pageResizedArgument, v5);
}

- (MUIconArgument)iconArgument
{
  return self->_iconArgument;
}

- (void)setIconArgument:(id)a3
{
}

- (MUAttributionArgument)attributionArgument
{
  return self->_attributionArgument;
}

- (void)setAttributionArgument:(id)a3
{
}

- (MUAmpArtworkArgument)artworkArgument
{
  return self->_artworkArgument;
}

- (void)setArtworkArgument:(id)a3
{
}

- (MUUserInteractionAction)userInteractionAction
{
  return self->_userInteractionAction;
}

- (void)setUserInteractionAction:(id)a3
{
}

- (MUWebMenuButton)webMenuButton
{
  return self->_webMenuButton;
}

- (void)setWebMenuButton:(id)a3
{
}

- (MUPageResizedArgument)pageResizedArgument
{
  return self->_pageResizedArgument;
}

- (void)setPageResizedArgument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webMenuButton, 0);
  objc_storeStrong((id *)&self->_userInteractionAction, 0);
  objc_storeStrong((id *)&self->_pageResizedArgument, 0);
  objc_storeStrong((id *)&self->_iconArgument, 0);
  objc_storeStrong((id *)&self->_attributionArgument, 0);
  objc_storeStrong((id *)&self->_artworkArgument, 0);
}

@end