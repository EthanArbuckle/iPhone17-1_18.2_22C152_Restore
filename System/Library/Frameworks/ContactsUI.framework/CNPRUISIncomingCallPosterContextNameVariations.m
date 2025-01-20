@interface CNPRUISIncomingCallPosterContextNameVariations
- (CNPRUISIncomingCallPosterContextNameVariations)initWithShortName:(id)a3 fullName:(id)a4;
- (PRUISIncomingCallPosterContextNameVariations)wrappedNameVariations;
@end

@implementation CNPRUISIncomingCallPosterContextNameVariations

- (void).cxx_destruct
{
}

- (PRUISIncomingCallPosterContextNameVariations)wrappedNameVariations
{
  return self->_wrappedNameVariations;
}

- (CNPRUISIncomingCallPosterContextNameVariations)initWithShortName:(id)a3 fullName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPRUISIncomingCallPosterContextNameVariations;
  v8 = [(CNPRUISIncomingCallPosterContextNameVariations *)&v14 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    v10 = v9;
    if (v6) {
      [v9 setObject:v6 forKeyedSubscript:&unk_1ED9159F8];
    }
    if (v7) {
      [v10 setObject:v7 forKeyedSubscript:&unk_1ED915A10];
    }
    uint64_t v11 = [objc_alloc((Class)getPRUISIncomingCallPosterContextNameVariationsClass[0]()) initWithNamesDictionary:v10];
    wrappedNameVariations = v8->_wrappedNameVariations;
    v8->_wrappedNameVariations = (PRUISIncomingCallPosterContextNameVariations *)v11;
  }
  return v8;
}

@end