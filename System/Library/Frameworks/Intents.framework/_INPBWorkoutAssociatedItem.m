@interface _INPBWorkoutAssociatedItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContentRating;
- (BOOL)hasItemID;
- (BOOL)hasItemLabel;
- (BOOL)hasItemName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)itemID;
- (_INPBDataString)itemName;
- (_INPBWorkoutAssociatedItem)initWithCoder:(id)a3;
- (id)contentRatingAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)itemLabelAsString:(int)a3;
- (int)StringAsContentRating:(id)a3;
- (int)StringAsItemLabel:(id)a3;
- (int)contentRating;
- (int)itemLabel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContentRating:(int)a3;
- (void)setHasContentRating:(BOOL)a3;
- (void)setHasItemLabel:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemLabel:(int)a3;
- (void)setItemName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWorkoutAssociatedItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemName, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

- (_INPBDataString)itemName
{
  return self->_itemName;
}

- (int)itemLabel
{
  return self->_itemLabel;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (int)contentRating
{
  return self->_contentRating;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBWorkoutAssociatedItem *)self hasContentRating])
  {
    uint64_t v4 = [(_INPBWorkoutAssociatedItem *)self contentRating];
    if (v4)
    {
      if (v4 == 1)
      {
        v5 = @"explicit";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"clean";
    }
    [v3 setObject:v5 forKeyedSubscript:@"contentRating"];
  }
  if (self->_itemID)
  {
    v6 = [(_INPBWorkoutAssociatedItem *)self itemID];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"itemID"];
  }
  if ([(_INPBWorkoutAssociatedItem *)self hasItemLabel])
  {
    uint64_t v8 = [(_INPBWorkoutAssociatedItem *)self itemLabel];
    if (v8 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5520D38[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"itemLabel"];
  }
  v10 = [(_INPBWorkoutAssociatedItem *)self itemName];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"itemName"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBWorkoutAssociatedItem *)self hasContentRating]) {
    uint64_t v3 = 2654435761 * self->_contentRating;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_itemID hash];
  if ([(_INPBWorkoutAssociatedItem *)self hasItemLabel]) {
    uint64_t v5 = 2654435761 * self->_itemLabel;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_INPBDataString *)self->_itemName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  int v5 = [(_INPBWorkoutAssociatedItem *)self hasContentRating];
  if (v5 != [v4 hasContentRating]) {
    goto LABEL_20;
  }
  if ([(_INPBWorkoutAssociatedItem *)self hasContentRating])
  {
    if ([v4 hasContentRating])
    {
      int contentRating = self->_contentRating;
      if (contentRating != [v4 contentRating]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBWorkoutAssociatedItem *)self itemID];
  uint64_t v8 = [v4 itemID];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_19;
  }
  uint64_t v9 = [(_INPBWorkoutAssociatedItem *)self itemID];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBWorkoutAssociatedItem *)self itemID];
    v12 = [v4 itemID];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  int v14 = [(_INPBWorkoutAssociatedItem *)self hasItemLabel];
  if (v14 != [v4 hasItemLabel]) {
    goto LABEL_20;
  }
  if ([(_INPBWorkoutAssociatedItem *)self hasItemLabel])
  {
    if ([v4 hasItemLabel])
    {
      int itemLabel = self->_itemLabel;
      if (itemLabel != [v4 itemLabel]) {
        goto LABEL_20;
      }
    }
  }
  v7 = [(_INPBWorkoutAssociatedItem *)self itemName];
  uint64_t v8 = [v4 itemName];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v16 = [(_INPBWorkoutAssociatedItem *)self itemName];
    if (!v16)
    {

LABEL_23:
      BOOL v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    v18 = [(_INPBWorkoutAssociatedItem *)self itemName];
    v19 = [v4 itemName];
    char v20 = [v18 isEqual:v19];

    if (v20) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v21 = 0;
LABEL_21:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBWorkoutAssociatedItem allocWithZone:](_INPBWorkoutAssociatedItem, "allocWithZone:") init];
  if ([(_INPBWorkoutAssociatedItem *)self hasContentRating]) {
    [(_INPBWorkoutAssociatedItem *)v5 setContentRating:[(_INPBWorkoutAssociatedItem *)self contentRating]];
  }
  v6 = (void *)[(NSString *)self->_itemID copyWithZone:a3];
  [(_INPBWorkoutAssociatedItem *)v5 setItemID:v6];

  if ([(_INPBWorkoutAssociatedItem *)self hasItemLabel]) {
    [(_INPBWorkoutAssociatedItem *)v5 setItemLabel:[(_INPBWorkoutAssociatedItem *)self itemLabel]];
  }
  id v7 = [(_INPBDataString *)self->_itemName copyWithZone:a3];
  [(_INPBWorkoutAssociatedItem *)v5 setItemName:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWorkoutAssociatedItem *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWorkoutAssociatedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWorkoutAssociatedItem *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWorkoutAssociatedItem *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWorkoutAssociatedItem *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBWorkoutAssociatedItem *)self hasContentRating]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBWorkoutAssociatedItem *)self itemID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBWorkoutAssociatedItem *)self hasItemLabel]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBWorkoutAssociatedItem *)self itemName];

  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(_INPBWorkoutAssociatedItem *)self itemName];
    PBDataWriterWriteSubmessage();

    id v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWorkoutAssociatedItemReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasItemName
{
  return self->_itemName != 0;
}

- (void)setItemName:(id)a3
{
}

- (int)StringAsItemLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"narrator"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"playlist"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"song"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"trainer"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"workout"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)itemLabelAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520D38[a3];
  }

  return v3;
}

- (void)setHasItemLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasItemLabel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setItemLabel:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int itemLabel = a3;
  }
}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (void)setItemID:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  itemID = self->_itemID;
  self->_itemID = v4;

  MEMORY[0x1F41817F8](v4, itemID);
}

- (int)StringAsContentRating:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"clean"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"explicit"];
  }

  return v4;
}

- (id)contentRatingAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"explicit";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"clean";
  }
  return v4;
}

- (void)setHasContentRating:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentRating
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContentRating:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int contentRating = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end