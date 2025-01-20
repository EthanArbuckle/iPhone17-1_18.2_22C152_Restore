@interface INWorkoutAssociatedItem
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSpeakableString)itemName;
- (INWorkoutAssociatedItem)initWithCoder:(id)a3;
- (INWorkoutAssociatedItem)initWithItemLabel:(int64_t)a3 itemID:(id)a4 contentRating:(int64_t)a5 itemName:(id)a6;
- (NSString)description;
- (NSString)itemID;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)contentRating;
- (int64_t)itemLabel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INWorkoutAssociatedItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemName, 0);

  objc_storeStrong((id *)&self->_itemID, 0);
}

- (INSpeakableString)itemName
{
  return self->_itemName;
}

- (int64_t)contentRating
{
  return self->_contentRating;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (int64_t)itemLabel
{
  return self->_itemLabel;
}

- (id)_dictionaryRepresentation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"itemLabel";
  v3 = [NSNumber numberWithInteger:self->_itemLabel];
  v12[0] = v3;
  v11[1] = @"itemID";
  itemID = self->_itemID;
  v5 = itemID;
  if (!itemID)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v5;
  v11[2] = @"contentRating";
  v6 = [NSNumber numberWithInteger:self->_contentRating];
  v12[2] = v6;
  v11[3] = @"itemName";
  itemName = self->_itemName;
  v8 = itemName;
  if (!itemName)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  if (!itemName) {

  }
  if (!itemID) {

  }
  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INWorkoutAssociatedItem;
  v6 = [(INWorkoutAssociatedItem *)&v11 description];
  v7 = [(INWorkoutAssociatedItem *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INWorkoutAssociatedItem *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_itemLabel - 1;
  if (v8 > 4) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E5520D10[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"itemLabel");

  objc_super v11 = [v6 encodeObject:self->_itemID];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"itemID");

  int64_t contentRating = self->_contentRating;
  v13 = @"unknown";
  if (contentRating == 2) {
    v13 = @"explicit";
  }
  if (contentRating == 1) {
    v14 = @"clean";
  }
  else {
    v14 = v13;
  }
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"contentRating");

  v16 = [v6 encodeObject:self->_itemName];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"itemName");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t itemLabel = self->_itemLabel;
  id v5 = a3;
  [v5 encodeInteger:itemLabel forKey:@"itemLabel"];
  [v5 encodeObject:self->_itemID forKey:@"itemID"];
  [v5 encodeInteger:self->_contentRating forKey:@"contentRating"];
  [v5 encodeObject:self->_itemName forKey:@"itemName"];
}

- (INWorkoutAssociatedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"itemLabel"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"itemID"];

  uint64_t v10 = [v4 decodeIntegerForKey:@"contentRating"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemName"];

  v12 = [(INWorkoutAssociatedItem *)self initWithItemLabel:v5 itemID:v9 contentRating:v10 itemName:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INWorkoutAssociatedItem *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v8 = 0;
      if (self->_itemLabel == v5->_itemLabel)
      {
        itemID = self->_itemID;
        if ((itemID == v5->_itemID || -[NSString isEqual:](itemID, "isEqual:"))
          && self->_contentRating == v5->_contentRating)
        {
          itemName = self->_itemName;
          if (itemName == v5->_itemName || -[INSpeakableString isEqual:](itemName, "isEqual:")) {
            BOOL v8 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_itemLabel];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_itemID hash] ^ v4;
  id v6 = [NSNumber numberWithInteger:self->_contentRating];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(INSpeakableString *)self->_itemName hash];

  return v8;
}

- (INWorkoutAssociatedItem)initWithItemLabel:(int64_t)a3 itemID:(id)a4 contentRating:(int64_t)a5 itemName:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)INWorkoutAssociatedItem;
  v12 = [(INWorkoutAssociatedItem *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_int64_t itemLabel = a3;
    uint64_t v14 = [v10 copy];
    itemID = v13->_itemID;
    v13->_itemID = (NSString *)v14;

    v13->_int64_t contentRating = a5;
    uint64_t v16 = [v11 copy];
    itemName = v13->_itemName;
    v13->_itemName = (INSpeakableString *)v16;
  }
  return v13;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:@"itemLabel"];
    uint64_t v10 = INWorkoutAssociatedItemLabelWithString(v9);

    id v11 = [v8 objectForKeyedSubscript:@"itemID"];
    v12 = [v8 objectForKeyedSubscript:@"contentRating"];
    uint64_t v13 = INWorkoutContentRatingLabelWithString(v12);

    uint64_t v14 = objc_opt_class();
    v15 = [v8 objectForKeyedSubscript:@"itemName"];
    uint64_t v16 = [v7 decodeObjectOfClass:v14 from:v15];

    v17 = (void *)[objc_alloc((Class)a1) initWithItemLabel:v10 itemID:v11 contentRating:v13 itemName:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end