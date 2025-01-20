@interface MUWebMenuButton
+ (Class)menuItemType;
- (BOOL)hasBoundingBox;
- (BOOL)hasMenuId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MUWebMenuButtonBoundingBox)boundingBox;
- (NSMutableArray)menuItems;
- (NSString)menuId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)menuItemAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)menuItemsCount;
- (void)addMenuItem:(id)a3;
- (void)clearMenuItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setMenuId:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUWebMenuButton

- (BOOL)hasMenuId
{
  return self->_menuId != 0;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (void)clearMenuItems
{
}

- (void)addMenuItem:(id)a3
{
  id v4 = a3;
  menuItems = self->_menuItems;
  id v8 = v4;
  if (!menuItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_menuItems;
    self->_menuItems = v6;

    id v4 = v8;
    menuItems = self->_menuItems;
  }
  [(NSMutableArray *)menuItems addObject:v4];
}

- (unint64_t)menuItemsCount
{
  return [(NSMutableArray *)self->_menuItems count];
}

- (id)menuItemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_menuItems objectAtIndex:a3];
}

+ (Class)menuItemType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUWebMenuButton;
  id v4 = [(MUWebMenuButton *)&v8 description];
  v5 = [(MUWebMenuButton *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  menuId = self->_menuId;
  if (menuId) {
    [v3 setObject:menuId forKey:@"menu_id"];
  }
  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    v7 = [(MUWebMenuButtonBoundingBox *)boundingBox dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"bounding_box"];
  }
  if ([(NSMutableArray *)self->_menuItems count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_menuItems, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_menuItems;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"menu_item"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MUWebMenuButtonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_menuId) {
    PBDataWriterWriteStringField();
  }
  if (self->_boundingBox) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_menuItems;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_menuId) {
    objc_msgSend(v8, "setMenuId:");
  }
  if (self->_boundingBox) {
    objc_msgSend(v8, "setBoundingBox:");
  }
  if ([(MUWebMenuButton *)self menuItemsCount])
  {
    [v8 clearMenuItems];
    unint64_t v4 = [(MUWebMenuButton *)self menuItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MUWebMenuButton *)self menuItemAtIndex:i];
        [v8 addMenuItem:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_menuId copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(MUWebMenuButtonBoundingBox *)self->_boundingBox copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_menuItems;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addMenuItem:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((menuId = self->_menuId, !((unint64_t)menuId | v4[2]))
     || -[NSString isEqual:](menuId, "isEqual:"))
    && ((boundingBox = self->_boundingBox, !((unint64_t)boundingBox | v4[1]))
     || -[MUWebMenuButtonBoundingBox isEqual:](boundingBox, "isEqual:")))
  {
    menuItems = self->_menuItems;
    if ((unint64_t)menuItems | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](menuItems, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_menuId hash];
  unint64_t v4 = [(MUWebMenuButtonBoundingBox *)self->_boundingBox hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_menuItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[MUWebMenuButton setMenuId:](self, "setMenuId:");
  }
  boundingBox = self->_boundingBox;
  uint64_t v6 = *((void *)v4 + 1);
  if (boundingBox)
  {
    if (v6) {
      -[MUWebMenuButtonBoundingBox mergeFrom:](boundingBox, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MUWebMenuButton setBoundingBox:](self, "setBoundingBox:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MUWebMenuButton addMenuItem:](self, "addMenuItem:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSString)menuId
{
  return self->_menuId;
}

- (void)setMenuId:(id)a3
{
}

- (MUWebMenuButtonBoundingBox)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuId, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

@end