@interface AVMediaSelectionNilOption
- (AVMediaSelectionNilOption)initWithGroup:(id)a3;
- (BOOL)_representsNilSelection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlayable;
- (id)_groupID;
- (id)_groupMediaType;
- (id)description;
- (id)dictionary;
- (id)group;
- (void)dealloc;
@end

@implementation AVMediaSelectionNilOption

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionNilOption;
  [(AVMediaSelectionOption *)&v3 dealloc];
}

- (AVMediaSelectionNilOption)initWithGroup:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVMediaSelectionNilOption;
  v4 = -[AVMediaSelectionOption initWithGroup:](&v11, sel_initWithGroup_);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_id groupID = (id)[a3 _groupID];
      v5->_id groupMediaType = (id)objc_msgSend((id)objc_msgSend(a3, "_groupMediaType"), "copy");
      v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      v7 = v6;
      id groupMediaType = v5->_groupMediaType;
      if (groupMediaType) {
        [v6 setObject:groupMediaType forKey:*MEMORY[0x1E4F34718]];
      }
      id groupID = v5->_groupID;
      if (groupID) {
        [v7 setObject:groupID forKey:*MEMORY[0x1E4F34708]];
      }
      v5->_dictionary = (NSDictionary *)[v7 copy];
      v5->_weakReferenceToGroup = (AVWeakReference *)(id)[a3 _weakReference];
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)dictionary
{
  return self->_dictionary;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  dictionary = self->_dictionary;
  uint64_t v6 = [a3 dictionary];
  return [(NSDictionary *)dictionary isEqual:v6];
}

- (id)group
{
  return [(AVWeakReference *)self->_weakReferenceToGroup referencedObject];
}

- (id)_groupID
{
  return self->_groupID;
}

- (id)_groupMediaType
{
  return self->_groupMediaType;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)_representsNilSelection
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"nil selection option for the following group: %@", -[AVMediaSelectionNilOption group](self, "group")];
}

@end