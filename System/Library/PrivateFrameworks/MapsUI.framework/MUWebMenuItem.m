@interface MUWebMenuItem
+ (Class)groupDataType;
- (BOOL)hasAction;
- (BOOL)hasAppArtwork;
- (BOOL)hasDisplayName;
- (BOOL)hasMenuItemId;
- (BOOL)hasSymbolImage;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MUUserInteractionAction)action;
- (NSMutableArray)groupDatas;
- (NSString)appArtwork;
- (NSString)displayName;
- (NSString)menuItemId;
- (NSString)symbolImage;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupDataAtIndex:(unint64_t)a3;
- (unint64_t)groupDatasCount;
- (unint64_t)hash;
- (void)addGroupData:(id)a3;
- (void)clearGroupDatas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(id)a3;
- (void)setAppArtwork:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGroupDatas:(id)a3;
- (void)setMenuItemId:(id)a3;
- (void)setSymbolImage:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUWebMenuItem

- (BOOL)hasMenuItemId
{
  return self->_menuItemId != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSymbolImage
{
  return self->_symbolImage != 0;
}

- (BOOL)hasAppArtwork
{
  return self->_appArtwork != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)clearGroupDatas
{
}

- (void)addGroupData:(id)a3
{
  id v4 = a3;
  groupDatas = self->_groupDatas;
  id v8 = v4;
  if (!groupDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_groupDatas;
    self->_groupDatas = v6;

    id v4 = v8;
    groupDatas = self->_groupDatas;
  }
  [(NSMutableArray *)groupDatas addObject:v4];
}

- (unint64_t)groupDatasCount
{
  return [(NSMutableArray *)self->_groupDatas count];
}

- (id)groupDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groupDatas objectAtIndex:a3];
}

+ (Class)groupDataType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAction
{
  return self->_action != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUWebMenuItem;
  id v4 = [(MUWebMenuItem *)&v8 description];
  v5 = [(MUWebMenuItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  menuItemId = self->_menuItemId;
  if (menuItemId) {
    [v3 setObject:menuItemId forKey:@"menu_item_id"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"display_name"];
  }
  symbolImage = self->_symbolImage;
  if (symbolImage) {
    [v4 setObject:symbolImage forKey:@"symbol_image"];
  }
  appArtwork = self->_appArtwork;
  if (appArtwork) {
    [v4 setObject:appArtwork forKey:@"app_artwork"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  if ([(NSMutableArray *)self->_groupDatas count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_groupDatas, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_groupDatas;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"groupData"];
  }
  action = self->_action;
  if (action)
  {
    v18 = [(MUUserInteractionAction *)action dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"action"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUWebMenuItemReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_menuItemId) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if (self->_symbolImage) {
    PBDataWriterWriteStringField();
  }
  if (self->_appArtwork) {
    PBDataWriterWriteStringField();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_groupDatas;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_action) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_menuItemId) {
    objc_msgSend(v8, "setMenuItemId:");
  }
  if (self->_displayName) {
    objc_msgSend(v8, "setDisplayName:");
  }
  if (self->_symbolImage) {
    objc_msgSend(v8, "setSymbolImage:");
  }
  if (self->_appArtwork) {
    objc_msgSend(v8, "setAppArtwork:");
  }
  if (self->_url) {
    objc_msgSend(v8, "setUrl:");
  }
  if ([(MUWebMenuItem *)self groupDatasCount])
  {
    [v8 clearGroupDatas];
    unint64_t v4 = [(MUWebMenuItem *)self groupDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MUWebMenuItem *)self groupDataAtIndex:i];
        [v8 addGroupData:v7];
      }
    }
  }
  if (self->_action) {
    objc_msgSend(v8, "setAction:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_menuItemId copyWithZone:a3];
  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_symbolImage copyWithZone:a3];
  long long v11 = (void *)v5[6];
  v5[6] = v10;

  uint64_t v12 = [(NSString *)self->_appArtwork copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v15 = (void *)v5[7];
  v5[7] = v14;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v16 = self->_groupDatas;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v20), "copyWithZone:", a3, (void)v25);
        [v5 addGroupData:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  id v22 = [(MUUserInteractionAction *)self->_action copyWithZone:a3];
  long long v23 = (void *)v5[1];
  v5[1] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((menuItemId = self->_menuItemId, !((unint64_t)menuItemId | v4[5]))
     || -[NSString isEqual:](menuItemId, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[3]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((symbolImage = self->_symbolImage, !((unint64_t)symbolImage | v4[6]))
     || -[NSString isEqual:](symbolImage, "isEqual:"))
    && ((appArtwork = self->_appArtwork, !((unint64_t)appArtwork | v4[2]))
     || -[NSString isEqual:](appArtwork, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[7])) || -[NSString isEqual:](url, "isEqual:"))
    && ((groupDatas = self->_groupDatas, !((unint64_t)groupDatas | v4[4]))
     || -[NSMutableArray isEqual:](groupDatas, "isEqual:")))
  {
    action = self->_action;
    if ((unint64_t)action | v4[1]) {
      char v12 = -[MUUserInteractionAction isEqual:](action, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_menuItemId hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_symbolImage hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_appArtwork hash];
  NSUInteger v7 = [(NSString *)self->_url hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_groupDatas hash];
  return v6 ^ v8 ^ [(MUUserInteractionAction *)self->_action hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[MUWebMenuItem setMenuItemId:](self, "setMenuItemId:");
  }
  if (*((void *)v4 + 3)) {
    -[MUWebMenuItem setDisplayName:](self, "setDisplayName:");
  }
  if (*((void *)v4 + 6)) {
    -[MUWebMenuItem setSymbolImage:](self, "setSymbolImage:");
  }
  if (*((void *)v4 + 2)) {
    -[MUWebMenuItem setAppArtwork:](self, "setAppArtwork:");
  }
  if (*((void *)v4 + 7)) {
    -[MUWebMenuItem setUrl:](self, "setUrl:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[MUWebMenuItem addGroupData:](self, "addGroupData:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  action = self->_action;
  uint64_t v11 = *((void *)v4 + 1);
  if (action)
  {
    if (v11) {
      -[MUUserInteractionAction mergeFrom:](action, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[MUWebMenuItem setAction:](self, "setAction:");
  }
}

- (NSString)menuItemId
{
  return self->_menuItemId;
}

- (void)setMenuItemId:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
}

- (NSString)appArtwork
{
  return self->_appArtwork;
}

- (void)setAppArtwork:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSMutableArray)groupDatas
{
  return self->_groupDatas;
}

- (void)setGroupDatas:(id)a3
{
}

- (MUUserInteractionAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_menuItemId, 0);
  objc_storeStrong((id *)&self->_groupDatas, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appArtwork, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end