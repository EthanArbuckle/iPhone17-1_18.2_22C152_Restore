@interface CRKRepeatedCharacterTableEntry
- (CRKRepeatedCharacterTableEntry)initWithCharacter:(char)a3;
- (id)rawStringValue;
- (id)stringValueWithLength:(unint64_t)a3;
@end

@implementation CRKRepeatedCharacterTableEntry

- (CRKRepeatedCharacterTableEntry)initWithCharacter:(char)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKRepeatedCharacterTableEntry;
  result = [(CRKRepeatedCharacterTableEntry *)&v5 init];
  if (result) {
    result->mCharacter = a3;
  }
  return result;
}

- (id)rawStringValue
{
  return &stru_26D7E7B00;
}

- (id)stringValueWithLength:(unint64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%c", self->mCharacter);
  objc_super v5 = [&stru_26D7E7B00 stringByPaddingToLength:a3 withString:v4 startingAtIndex:0];

  return v5;
}

@end