@interface INRideDriver
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INRideDriver)initWithCoder:(id)a3;
- (INRideDriver)initWithHandle:(NSString *)handle displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber;
- (INRideDriver)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber;
- (INRideDriver)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber;
- (INRideDriver)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9;
- (INRideDriver)initWithPhoneNumber:(NSString *)phoneNumber nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating;
- (NSString)phoneNumber;
- (NSString)rating;
- (id)_dictionaryRepresentation;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 aliases:(id)a10;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 phoneNumber:(id)a10;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRideDriver

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INRideDriver *)self copy];
    v9 = [(INPerson *)self image];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__INRideDriver_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E551E2D0;
      v10[4] = v8;
      id v11 = v7;
      v6[2](v6, v9, v10);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

uint64_t __74__INRideDriver_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setImage:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void).cxx_destruct
{
}

- (NSString)rating
{
  return self->_rating;
}

- (id)_dictionaryRepresentation
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v12.receiver = self;
  v12.super_class = (Class)INRideDriver;
  v4 = [(INPerson *)&v12 _dictionaryRepresentation];
  v5 = [v3 dictionaryWithDictionary:v4];

  v13[0] = @"rating";
  rating = self->_rating;
  id v7 = rating;
  if (!rating)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = @"phoneNumber";
  v14[0] = v7;
  v8 = [(INRideDriver *)self phoneNumber];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v5 addEntriesFromDictionary:v10];

  if (!v8) {
  if (!rating)
  }

  return v5;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16
{
  return -[INRideDriver _initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:](self, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:rating:aliases:", a3, a4, a5, a6, a7, a8);
}

- (INRideDriver)initWithPersonHandle:(id)a3 nameComponents:(id)a4 displayName:(id)a5 image:(id)a6 contactIdentifier:(id)a7 customIdentifier:(id)a8 isMe:(BOOL)a9
{
  return (INRideDriver *)[(INRideDriver *)self _initWithUserInput:0 personHandle:a3 nameComponents:a4 displayName:a5 image:a6 contactIdentifier:a7 rating:0 aliases:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INRideDriver;
  id v4 = a3;
  [(INPerson *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_rating, @"rating", v5.receiver, v5.super_class);
}

- (INRideDriver)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INRideDriver;
  objc_super v5 = [(INPerson *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rating"];
    rating = v5->_rating;
    v5->_rating = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)INRideDriver,
        [(INPerson *)&v9 isEqual:v4]))
  {
    objc_super v5 = v4;
    rating = self->_rating;
    BOOL v7 = rating == (NSString *)v5[17] || -[NSString isEqual:](rating, "isEqual:");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)INRideDriver;
  unint64_t v3 = [(INPerson *)&v5 hash];
  return [(NSString *)self->_rating hash] ^ v3;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 phoneNumber:(id)a10
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v17 = a10;
  v18 = v17;
  if (v17)
  {
    id v39 = v17;
    id v19 = a9;
    id v20 = a8;
    id v21 = a7;
    id v22 = a6;
    id v23 = a5;
    id v24 = a4;
    id v25 = a3;
    v26 = [[INPersonHandle alloc] initWithValue:v39 type:2];
    v40[0] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v28 = [(INRideDriver *)self _initWithUserInput:v25 personHandle:v24 nameComponents:v23 displayName:v22 image:v21 contactIdentifier:v20 rating:v19 aliases:v27];

    id v29 = v28;
    v18 = v39;
  }
  else
  {
    id v30 = a9;
    id v31 = a8;
    id v32 = a7;
    id v33 = a6;
    id v34 = a5;
    id v35 = a4;
    id v36 = a3;
    id v37 = [(INRideDriver *)self _initWithUserInput:v36 personHandle:v35 nameComponents:v34 displayName:v33 image:v32 contactIdentifier:v31 rating:v30 aliases:0];

    id v29 = v37;
  }

  return v29;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 rating:(id)a9 aliases:(id)a10
{
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)INRideDriver;
  char v23 = 0;
  char v22 = 0;
  v18 = [(INPerson *)&v24 _initWithUserInput:a3 personHandle:a4 nameComponents:a5 displayName:a6 image:a7 contactIdentifier:a8 customIdentifier:0 relationship:0 aliases:a10 suggestionType:0 isMe:v22 scoredAlternatives:0 sourceAppBundleIdentifier:0 phonemeData:0 isContactSuggestion:v23 searchProvider:0];
  if (v18)
  {
    uint64_t v19 = [v17 copy];
    id v20 = (void *)v18[17];
    v18[17] = v19;
  }
  return v18;
}

- (INRideDriver)initWithPhoneNumber:(NSString *)phoneNumber nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating
{
  objc_super v12 = rating;
  v13 = image;
  v14 = displayName;
  v15 = nameComponents;
  v16 = phoneNumber;
  id v17 = [[INPersonHandle alloc] initWithValue:v16 type:2];

  v24.receiver = self;
  v24.super_class = (Class)INRideDriver;
  char v23 = 0;
  char v22 = 0;
  v18 = [(INPerson *)&v24 _initWithUserInput:0 personHandle:v17 nameComponents:v15 displayName:v14 image:v13 contactIdentifier:0 customIdentifier:0 relationship:0 aliases:0 suggestionType:0 isMe:v22 scoredAlternatives:0 sourceAppBundleIdentifier:0 phonemeData:0 isContactSuggestion:v23 searchProvider:0];

  if (v18)
  {
    uint64_t v19 = [(NSString *)v12 copy];
    id v20 = v18->_rating;
    v18->_rating = (NSString *)v19;
  }
  return v18;
}

- (NSString)phoneNumber
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(INPerson *)self personHandle];
  uint64_t v4 = [v3 value];
  if (v4)
  {
    objc_super v5 = (void *)v4;
    uint64_t v6 = [(INPerson *)self personHandle];
    uint64_t v7 = [v6 type];

    if (v7 == 2)
    {
      v8 = [(INPerson *)self personHandle];
      objc_super v9 = v8;
LABEL_16:
      v10 = [v8 value];
      goto LABEL_17;
    }
  }
  else
  {
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v9 = [(INPerson *)self aliases];
  v10 = (void *)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 value];
        if (v14)
        {
          v15 = (void *)v14;
          uint64_t v16 = [v13 type];

          if (v16 == 2)
          {
            v8 = v13;
            goto LABEL_16;
          }
        }
      }
      v10 = (void *)[v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INRideDriver)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  objc_super v12 = phoneNumber;
  v13 = rating;
  uint64_t v14 = image;
  v15 = nameComponents;
  uint64_t v16 = handle;
  id v17 = [[INPersonHandle alloc] initWithValue:v16 type:0];

  long long v18 = [(INRideDriver *)self initWithPersonHandle:v17 nameComponents:v15 displayName:0 image:v14 rating:v13 phoneNumber:v12];
  return v18;
}

- (INRideDriver)initWithHandle:(NSString *)handle displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  objc_super v12 = phoneNumber;
  v13 = rating;
  uint64_t v14 = image;
  v15 = displayName;
  uint64_t v16 = handle;
  id v17 = [[INPersonHandle alloc] initWithValue:v16 type:0];

  long long v18 = [(INRideDriver *)self initWithPersonHandle:v17 nameComponents:0 displayName:v15 image:v14 rating:v13 phoneNumber:v12];
  return v18;
}

- (INRideDriver)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image rating:(NSString *)rating phoneNumber:(NSString *)phoneNumber
{
  return (INRideDriver *)[(INRideDriver *)self _initWithUserInput:0 personHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:0 rating:rating phoneNumber:phoneNumber];
}

@end