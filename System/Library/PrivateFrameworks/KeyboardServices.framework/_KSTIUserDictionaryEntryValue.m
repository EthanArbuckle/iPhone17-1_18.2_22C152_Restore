@interface _KSTIUserDictionaryEntryValue
+ (BOOL)supportsSecureCoding;
+ (id)valueWithEntry:(id)a3;
- (BOOL)matchesEntry:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)phrase;
- (NSString)shortcut;
- (_KSTIUserDictionaryEntryValue)initWithCoder:(id)a3;
- (id)shortcutForSorting;
- (void)encodeWithCoder:(id)a3;
- (void)setPhrase:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation _KSTIUserDictionaryEntryValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)valueWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 phrase];
  [v5 setPhrase:v6];

  v7 = [v4 shortcut];
  [v5 setShortcut:v7];

  v8 = [v4 timestamp];

  [v5 setTimestamp:v8];
  return v5;
}

- (_KSTIUserDictionaryEntryValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSTIUserDictionaryEntryValue;
  id v5 = [(_KSTIUserDictionaryEntryValue *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
    uint64_t v7 = [v6 copy];
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    uint64_t v10 = [v9 copy];
    shortcut = v5->_shortcut;
    v5->_shortcut = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  phrase = self->_phrase;
  id v8 = v4;
  if (phrase)
  {
    [v4 encodeObject:phrase forKey:@"phrase"];
    id v4 = v8;
  }
  shortcut = self->_shortcut;
  if (shortcut)
  {
    [v8 encodeObject:shortcut forKey:@"shortcut"];
    id v4 = v8;
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    [v8 encodeObject:timestamp forKey:@"timestamp"];
    id v4 = v8;
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(_KSTIUserDictionaryEntryValue *)self shortcut];
  id v5 = [(_KSTIUserDictionaryEntryValue *)self phrase];
  v6 = [v3 stringWithFormat:@"{%@ => %@}", v4, v5];

  return (NSString *)v6;
}

- (BOOL)matchesEntry:(id)a3
{
  id v4 = a3;
  id v5 = [(_KSTIUserDictionaryEntryValue *)self phrase];
  uint64_t v6 = [v4 phrase];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    id v8 = [(_KSTIUserDictionaryEntryValue *)self phrase];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = v6 == 0;
  }

  uint64_t v10 = [(_KSTIUserDictionaryEntryValue *)self shortcut];
  uint64_t v11 = [v4 shortcut];
  uint64_t v12 = (void *)v11;
  if (v10)
  {
    v13 = [(_KSTIUserDictionaryEntryValue *)self shortcut];
    char v14 = [v12 isEqualToString:v13];
  }
  else
  {
    char v14 = v11 == 0;
  }

  return v9 & v14;
}

- (id)shortcutForSorting
{
  v2 = [(_KSTIUserDictionaryEntryValue *)self shortcut];
  v3 = v2;
  if (!v2) {
    v2 = &stru_26DE8B7B0;
  }
  id v4 = v2;

  return v4;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (void)setPhrase:(id)a3
{
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

@end