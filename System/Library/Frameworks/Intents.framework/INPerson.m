@interface INPerson
+ (BOOL)supportsSecureCoding;
+ (id)expectedCNContactKeys;
+ (id)toNilScoredPersons:(id)a3;
- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4;
- (BOOL)isContactSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (INImage)image;
- (INPerson)initWithCoder:(id)a3;
- (INPerson)initWithContact:(id)a3;
- (INPerson)initWithHandle:(NSString *)handle displayName:(NSString *)displayName contactIdentifier:(NSString *)contactIdentifier;
- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents contactIdentifier:(NSString *)contactIdentifier;
- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier aliases:(NSArray *)aliases suggestionType:(INPersonSuggestionType)suggestionType;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isContactSuggestion:(BOOL)isContactSuggestion suggestionType:(INPersonSuggestionType)suggestionType;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe suggestionType:(INPersonSuggestionType)suggestionType;
- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier relationship:(INPersonRelationship)relationship;
- (INPersonHandle)personHandle;
- (INPersonRelationship)relationship;
- (INPersonSuggestionType)suggestionType;
- (NSArray)aliases;
- (NSArray)alternatives;
- (NSArray)scoredAlternatives;
- (NSPersonNameComponents)nameComponents;
- (NSString)contactIdentifier;
- (NSString)customIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)handle;
- (NSString)lastName;
- (NSString)phonemeData;
- (NSString)sourceAppBundleIdentifier;
- (NSString)userIdentifier;
- (NSString)userName;
- (NSString)userURIString;
- (id)_aliases;
- (id)_dictionaryRepresentation;
- (id)_displayName;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 alternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17;
- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17 searchProvider:(int64_t)a18;
- (id)_intents_cacheableObjects;
- (id)_intents_indexingRepresentation;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (id)_userInput;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)spokenPhrases;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)searchProvider;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAliases:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setPersonHandle:(id)a3;
- (void)setPhonemeData:(id)a3;
- (void)setRelationship:(id)a3;
- (void)setScoredAlternatives:(id)a3;
- (void)setSearchProvider:(int64_t)a3;
- (void)setSourceAppBundleIdentifier:(id)a3;
- (void)setSuggestionType:(int64_t)a3;
@end

@implementation INPerson

- (NSString)userURIString
{
  v2 = [(INPerson *)self personHandle];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)userIdentifier
{
  v2 = [(INPerson *)self personHandle];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)userName
{
  v2 = [(INPerson *)self personHandle];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)lastName
{
  v2 = [(INPerson *)self nameComponents];
  v3 = [v2 familyName];

  return (NSString *)v3;
}

- (NSString)firstName
{
  v2 = [(INPerson *)self nameComponents];
  v3 = [v2 givenName];

  return (NSString *)v3;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INPerson *)self image];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(INPerson *)self image];
    v7 = [v6 _identifier];
    v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      v9 = [(INPerson *)self image];
      v10 = [v9 _identifier];
      v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [(INPerson *)self image];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  v2 = [(INPerson *)self image];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  v6 = [(INPerson *)self personHandle];
  uint64_t v7 = [v6 type];

  if (v7 != 2) {
    goto LABEL_12;
  }
  v8 = [(INPerson *)self displayName];
  v9 = [(INPerson *)self personHandle];
  v10 = [v9 value];
  char v11 = [v8 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2048 error:0];
    uint64_t v13 = objc_msgSend(v12, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));

    if (v13 != 1)
    {

LABEL_12:
      id v19 = [(INPerson *)self displayName];
      goto LABEL_13;
    }
  }
  v14 = [v5 locale];
  v15 = [v14 regionCode];
  v16 = [v15 lowercaseString];

  if (!v16)
  {
    v16 = (void *)CPPhoneNumberCopyNetworkCountryCode();
    if (!v16) {
      v16 = (void *)CPPhoneNumberCopyHomeCountryCode();
    }
  }
  v17 = [(INPerson *)self personHandle];
  [v17 value];
  v18 = (void *)PNCreateFormattedStringWithCountry();

  if ([v18 length])
  {
    id v19 = v18;
  }
  else
  {
    v20 = [(INPerson *)self personHandle];
    id v19 = [v20 value];
  }
LABEL_13:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_personHandle, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_scoredAlternatives, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)setSearchProvider:(int64_t)a3
{
  self->_searchProvider = a3;
}

- (int64_t)searchProvider
{
  return self->_searchProvider;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setPhonemeData:(id)a3
{
}

- (NSString)phonemeData
{
  return self->_phonemeData;
}

- (void)setScoredAlternatives:(id)a3
{
}

- (NSArray)scoredAlternatives
{
  return self->_scoredAlternatives;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setSuggestionType:(int64_t)a3
{
  self->_suggestionType = a3;
}

- (INPersonSuggestionType)suggestionType
{
  return self->_suggestionType;
}

- (void)setAliases:(id)a3
{
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (BOOL)isContactSuggestion
{
  return self->_contactSuggestion;
}

- (void)setRelationship:(id)a3
{
}

- (INPersonRelationship)relationship
{
  return self->_relationship;
}

- (void)setCustomIdentifier:(id)a3
{
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setImage:(id)a3
{
}

- (INImage)image
{
  return self->_image;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setPersonHandle:(id)a3
{
}

- (INPersonHandle)personHandle
{
  return self->_personHandle;
}

- (id)_dictionaryRepresentation
{
  v27[8] = *MEMORY[0x1E4F143B8];
  uint64_t personHandle = (uint64_t)self->_personHandle;
  uint64_t v25 = personHandle;
  v26[0] = @"personHandle";
  if (!personHandle)
  {
    uint64_t personHandle = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)personHandle;
  v27[0] = personHandle;
  v26[1] = @"nameComponents";
  uint64_t nameComponents = (uint64_t)self->_nameComponents;
  uint64_t v24 = nameComponents;
  if (!nameComponents)
  {
    uint64_t nameComponents = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)nameComponents;
  v27[1] = nameComponents;
  v26[2] = @"displayName";
  displayName = self->_displayName;
  uint64_t v6 = (uint64_t)displayName;
  if (!displayName)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = @"image";
  image = self->_image;
  uint64_t v8 = (uint64_t)image;
  if (!image)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = @"contactIdentifier";
  contactIdentifier = self->_contactIdentifier;
  uint64_t v10 = (uint64_t)contactIdentifier;
  if (!contactIdentifier)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  id v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = @"customIdentifier";
  customIdentifier = self->_customIdentifier;
  v12 = customIdentifier;
  if (!customIdentifier)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v12;
  v26[6] = @"relationship";
  relationship = self->_relationship;
  v14 = relationship;
  if (!relationship)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[6] = v14;
  v26[7] = @"siriMatches";
  v15 = [(INPerson *)self siriMatches];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[7] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
  if (!v15) {

  }
  if (relationship)
  {
    if (customIdentifier) {
      goto LABEL_21;
    }
  }
  else
  {

    if (customIdentifier)
    {
LABEL_21:
      if (contactIdentifier) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }

  if (contactIdentifier)
  {
LABEL_22:
    if (image) {
      goto LABEL_23;
    }
LABEL_34:

    if (displayName) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
LABEL_33:

  if (!image) {
    goto LABEL_34;
  }
LABEL_23:
  if (displayName) {
    goto LABEL_24;
  }
LABEL_35:

LABEL_24:
  if (!v24) {

  }
  if (!v25) {

  }
  return v17;
}

- (INPerson)initWithContact:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  v43 = objc_msgSend(MEMORY[0x1E4F28F30], "componentsForContact:");
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = getCNContactPhoneNumbersKey();
  int v5 = [v44 isKeyAvailable:v4];

  if (v5)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v6 = [v44 phoneNumbers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v50 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          char v11 = [INPersonHandle alloc];
          v12 = [v10 value];
          uint64_t v13 = [v12 stringValue];
          v14 = INPersonHandleLabelForCNLabeledValue(v10);
          v15 = [(INPersonHandle *)v11 initWithValue:v13 type:2 label:v14];

          [v3 addObject:v15];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v7);
    }
  }
  v16 = getCNContactEmailAddressesKey();
  int v17 = [v44 isKeyAvailable:v16];

  if (v17)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v18 = [v44 emailAddresses];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v23 = [INPersonHandle alloc];
          uint64_t v24 = [v22 value];
          uint64_t v25 = INPersonHandleLabelForCNLabeledValue(v22);
          v26 = [(INPersonHandle *)v23 initWithValue:v24 type:1 label:v25];

          [v3 addObject:v26];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v19);
    }
  }
  v27 = [v3 firstObject];
  if ((unint64_t)[v3 count] < 2)
  {

    v3 = 0;
  }
  else
  {
    [v3 removeObjectAtIndex:0];
  }
  v28 = getCNContactIdentifierKey();
  int v29 = [v44 isKeyAvailable:v28];

  if (v29)
  {
    v30 = [v44 identifier];
  }
  else
  {
    v30 = 0;
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  v31 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr;
  uint64_t v61 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    uint64_t v53 = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = __getCNContactImageDataAvailableKeySymbolLoc_block_invoke;
    v56 = &unk_1E5520EB8;
    v57 = &v58;
    v32 = (void *)ContactsLibrary_33503();
    v33 = dlsym(v32, "CNContactImageDataAvailableKey");
    *(void *)(v57[1] + 24) = v33;
    getCNContactImageDataAvailableKeySymbolLoc_ptr = *(void *)(v57[1] + 24);
    v31 = (id *)v59[3];
  }
  _Block_object_dispose(&v58, 8);
  if (!v31) {
    goto LABEL_39;
  }
  id v34 = *v31;
  if (![v44 isKeyAvailable:v34])
  {
    v39 = 0;
    goto LABEL_36;
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  v35 = (void *)getCNContactImageDataKeySymbolLoc_ptr;
  uint64_t v61 = getCNContactImageDataKeySymbolLoc_ptr;
  if (!getCNContactImageDataKeySymbolLoc_ptr)
  {
    uint64_t v53 = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    v55 = __getCNContactImageDataKeySymbolLoc_block_invoke;
    v56 = &unk_1E5520EB8;
    v57 = &v58;
    v36 = (void *)ContactsLibrary_33503();
    v37 = dlsym(v36, "CNContactImageDataKey");
    *(void *)(v57[1] + 24) = v37;
    getCNContactImageDataKeySymbolLoc_ptr = *(void *)(v57[1] + 24);
    v35 = (void *)v59[3];
  }
  _Block_object_dispose(&v58, 8);
  if (!v35)
  {
LABEL_39:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  int v38 = [v44 isKeyAvailable:*v35];

  if (!v38 || ![v44 imageDataAvailable])
  {
    v39 = 0;
    goto LABEL_38;
  }
  id v34 = [v44 imageData];
  v39 = +[INImage imageWithImageData:v34];
LABEL_36:

LABEL_38:
  v40 = [(INPerson *)self initWithPersonHandle:v27 nameComponents:v43 displayName:0 image:v39 contactIdentifier:v30 customIdentifier:0 aliases:v3 suggestionType:0];

  return v40;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 scoredAlternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17 searchProvider:(int64_t)a18
{
  id v23 = a3;
  id v24 = a4;
  id v59 = a5;
  id v58 = a6;
  id v57 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a10;
  id v28 = a11;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  v60.receiver = self;
  v60.super_class = (Class)INPerson;
  v32 = [(INPerson *)&v60 init];
  if (v32)
  {
    uint64_t v33 = [v23 copy];
    userInput = v32->_userInput;
    v32->_userInput = (NSString *)v33;

    uint64_t v35 = [v24 copy];
    uint64_t personHandle = v32->_personHandle;
    v32->_uint64_t personHandle = (INPersonHandle *)v35;

    uint64_t v37 = [v59 copy];
    uint64_t nameComponents = v32->_nameComponents;
    v32->_uint64_t nameComponents = (NSPersonNameComponents *)v37;

    uint64_t v39 = [v58 copy];
    displayName = v32->_displayName;
    v32->_displayName = (NSString *)v39;

    uint64_t v41 = [v57 copy];
    image = v32->_image;
    v32->_image = (INImage *)v41;

    uint64_t v43 = [v25 copy];
    contactIdentifier = v32->_contactIdentifier;
    v32->_contactIdentifier = (NSString *)v43;

    uint64_t v45 = [v26 copy];
    customIdentifier = v32->_customIdentifier;
    v32->_customIdentifier = (NSString *)v45;

    uint64_t v47 = [v27 copy];
    relationship = v32->_relationship;
    v32->_relationship = (NSString *)v47;

    uint64_t v49 = [v28 copy];
    aliases = v32->_aliases;
    v32->_aliases = (NSArray *)v49;

    v32->_suggestionType = a12;
    v32->_isMe = a13;
    uint64_t v51 = [v29 copy];
    scoredAlternatives = v32->_scoredAlternatives;
    v32->_scoredAlternatives = (NSArray *)v51;

    objc_storeStrong((id *)&v32->_sourceAppBundleIdentifier, a15);
    uint64_t v53 = [v31 copy];
    phonemeData = v32->_phonemeData;
    v32->_phonemeData = (NSString *)v53;

    v32->_contactSuggestion = a17;
    v32->_searchProvider = a18;
  }

  return v32;
}

- (id)_initWithUserInput:(id)a3 personHandle:(id)a4 nameComponents:(id)a5 displayName:(id)a6 image:(id)a7 contactIdentifier:(id)a8 customIdentifier:(id)a9 relationship:(id)a10 aliases:(id)a11 suggestionType:(int64_t)a12 isMe:(BOOL)a13 alternatives:(id)a14 sourceAppBundleIdentifier:(id)a15 phonemeData:(id)a16 isContactSuggestion:(BOOL)a17
{
  id v35 = a16;
  id v33 = a15;
  id v30 = a11;
  id v20 = a10;
  id v28 = a9;
  id v29 = a8;
  id v21 = a7;
  id v22 = a6;
  id v32 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v37 = +[INPerson toNilScoredPersons:a14];
  LOBYTE(v27) = a17;
  LOBYTE(v26) = a13;
  id v39 = [(INPerson *)self _initWithUserInput:v24 personHandle:v23 nameComponents:v32 displayName:v22 image:v21 contactIdentifier:v29 customIdentifier:v28 relationship:v20 aliases:v30 suggestionType:a12 isMe:v26 scoredAlternatives:v37 sourceAppBundleIdentifier:v33 phonemeData:v35 isContactSuggestion:v27 searchProvider:0];

  return v39;
}

- (void)setAlternatives:(id)a3
{
  self->_scoredAlternatives = +[INPerson toNilScoredPersons:a3];

  MEMORY[0x1F41817F8]();
}

- (NSArray)alternatives
{
  return (NSArray *)[(NSArray *)self->_scoredAlternatives valueForKey:@"person"];
}

- (id)_aliases
{
  return self->_aliases;
}

- (id)_userInput
{
  return self->_userInput;
}

- (id)_displayName
{
  return self->_displayName;
}

- (INPerson)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)INPerson;
  int v5 = [(INPerson *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userInput"];
    userInput = v5->_userInput;
    v5->_userInput = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personHandle"];
    uint64_t personHandle = v5->_personHandle;
    v5->_uint64_t personHandle = (INPersonHandle *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameComponents"];
    uint64_t nameComponents = v5->_nameComponents;
    v5->_uint64_t nameComponents = (NSPersonNameComponents *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (INImage *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customIdentifier"];
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relationship"];
    relationship = v5->_relationship;
    v5->_relationship = (NSString *)v23;

    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"aliases"];
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v28;

    v5->_suggestionType = [v4 decodeIntegerForKey:@"suggestionType"];
    v5->_isMe = [v4 decodeBoolForKey:@"isMe"];
    id v30 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    id v32 = [v30 setWithArray:v31];
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"scoredAlternatives"];
    scoredAlternatives = v5->_scoredAlternatives;
    v5->_scoredAlternatives = (NSArray *)v33;

    v5->_contactSuggestion = [v4 decodeBoolForKey:@"contactSuggestion"];
    v5->_searchProvider = (int)[v4 decodeIntForKey:@"searchProvider"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userInput = self->_userInput;
  id v5 = a3;
  [v5 encodeObject:userInput forKey:@"_userInput"];
  [v5 encodeObject:self->_personHandle forKey:@"personHandle"];
  [v5 encodeObject:self->_nameComponents forKey:@"nameComponents"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_customIdentifier forKey:@"customIdentifier"];
  [v5 encodeObject:self->_relationship forKey:@"relationship"];
  [v5 encodeObject:self->_aliases forKey:@"aliases"];
  [v5 encodeInteger:self->_suggestionType forKey:@"suggestionType"];
  [v5 encodeBool:self->_isMe forKey:@"isMe"];
  [v5 encodeObject:self->_scoredAlternatives forKey:@"scoredAlternatives"];
  [v5 encodeBool:self->_contactSuggestion forKey:@"contactSuggestion"];
  [v5 encodeInteger:self->_searchProvider forKey:@"searchProvider"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v22 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v17 = (void *)[(NSString *)self->_userInput copyWithZone:a3];
  id v5 = [(INPersonHandle *)self->_personHandle copyWithZone:a3];
  uint64_t v21 = (void *)[(NSPersonNameComponents *)self->_nameComponents copyWithZone:a3];
  id v20 = (void *)[(NSString *)self->_displayName copyWithZone:a3];
  id v19 = [(INImage *)self->_image copyWithZone:a3];
  v18 = (void *)[(NSString *)self->_contactIdentifier copyWithZone:a3];
  v16 = (void *)[(NSString *)self->_customIdentifier copyWithZone:a3];
  uint64_t v15 = (void *)[(NSString *)self->_relationship copyWithZone:a3];
  uint64_t v6 = (void *)[(NSArray *)self->_aliases copyWithZone:a3];
  BOOL isMe = self->_isMe;
  int64_t suggestionType = self->_suggestionType;
  v9 = (void *)[(NSArray *)self->_scoredAlternatives copyWithZone:a3];
  uint64_t v10 = (void *)[(NSString *)self->_sourceAppBundleIdentifier copyWithZone:a3];
  char v11 = (void *)[(NSString *)self->_phonemeData copyWithZone:a3];
  LOBYTE(v14) = self->_contactSuggestion;
  LOBYTE(v13) = isMe;
  uint64_t v23 = objc_msgSend(v22, "_initWithUserInput:personHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:relationship:aliases:suggestionType:isMe:scoredAlternatives:sourceAppBundleIdentifier:phonemeData:isContactSuggestion:searchProvider:", v17, v5, v21, v20, v19, v18, v16, v15, v6, suggestionType, v13, v9, v10, v11, v14,
                  self->_searchProvider);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (unsigned __int8 *)v4;
    if ([(NSString *)self->_contactIdentifier length]
      && [*((id *)v5 + 12) length]
      && [(NSString *)self->_contactIdentifier isEqual:*((void *)v5 + 12)]
      && (uint64_t v6 = self->_personHandle) != 0
      && *((void *)v5 + 10)
      && -[INPersonHandle isEqual:](v6, "isEqual:"))
    {
      BOOL v7 = 1;
    }
    else
    {
      userInput = self->_userInput;
      if (userInput != *((NSString **)v5 + 3) && !-[NSString isEqual:](userInput, "isEqual:")) {
        goto LABEL_34;
      }
      uint64_t personHandle = self->_personHandle;
      if (personHandle != *((INPersonHandle **)v5 + 10) && !-[INPersonHandle isEqual:](personHandle, "isEqual:")) {
        goto LABEL_34;
      }
      uint64_t nameComponents = self->_nameComponents;
      if (nameComponents != *((NSPersonNameComponents **)v5 + 2)
        && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
      {
        goto LABEL_34;
      }
      if (((displayName = self->_displayName, displayName == *((NSString **)v5 + 1))
         || -[NSString isEqual:](displayName, "isEqual:"))
        && ((image = self->_image, image == *((INImage **)v5 + 11)) || -[INImage isEqual:](image, "isEqual:"))
        && ((contactIdentifier = self->_contactIdentifier, contactIdentifier == *((NSString **)v5 + 12))
         || -[NSString isEqual:](contactIdentifier, "isEqual:"))
        && ((customIdentifier = self->_customIdentifier, customIdentifier == *((NSString **)v5 + 13))
         || -[NSString isEqual:](customIdentifier, "isEqual:"))
        && ((aliases = self->_aliases, aliases == *((NSArray **)v5 + 4))
         || -[NSArray isEqual:](aliases, "isEqual:"))
        && self->_suggestionType == *((void *)v5 + 5)
        && self->_isMe == v5[56]
        && ((scoredAlternatives = self->_scoredAlternatives, scoredAlternatives == *((NSArray **)v5 + 6))
         || -[NSArray isEqual:](scoredAlternatives, "isEqual:"))
        && ((phonemeData = self->_phonemeData, phonemeData == *((NSString **)v5 + 15))
         || -[NSString isEqual:](phonemeData, "isEqual:"))
        && self->_contactSuggestion == v5[72])
      {
        BOOL v7 = self->_searchProvider == *((void *)v5 + 16);
      }
      else
      {
LABEL_34:
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPersonHandle *)self->_personHandle hash];
  uint64_t v4 = [(NSPersonNameComponents *)self->_nameComponents hash] ^ v3;
  unint64_t v5 = [(INImage *)self->_image hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_contactIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_customIdentifier hash];
  uint64_t v8 = v6 ^ v7 ^ [(NSArray *)self->_aliases hash];
  v9 = [NSNumber numberWithInteger:self->_suggestionType];
  uint64_t v10 = [v9 hash];
  char v11 = [NSNumber numberWithBool:self->_isMe];
  uint64_t v12 = v8 ^ v10 ^ [v11 hash];
  uint64_t v13 = [(NSArray *)self->_scoredAlternatives hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_phonemeData hash];
  uint64_t v15 = [NSNumber numberWithBool:self->_contactSuggestion];
  uint64_t v16 = v14 ^ [v15 hash];
  uint64_t v17 = [NSNumber numberWithInteger:self->_searchProvider];
  unint64_t v18 = v12 ^ v16 ^ [v17 hash];

  displayName = self->_displayName;
  id v20 = [(INPersonHandle *)self->_personHandle value];
  LOBYTE(displayName) = [(NSString *)displayName isEqualToString:v20];

  if ((displayName & 1) == 0) {
    v18 ^= [(NSString *)self->_displayName hash];
  }
  return v18;
}

- (void)setDisplayName:(id)a3
{
  self->_displayName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)displayName
{
  unint64_t v3 = self->_displayName;
  if (![(NSString *)v3 length])
  {
    uint64_t nameComponents = self->_nameComponents;
    if (nameComponents)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F28F38];
      NSUInteger v6 = nameComponents;
      uint64_t v7 = [v5 localizedStringFromPersonNameComponents:v6 style:0 options:0];

      unint64_t v3 = (NSString *)v7;
    }
  }
  if (![(NSString *)v3 length])
  {
    INPersonHandleType v8 = [(INPersonHandle *)self->_personHandle type];
    uint64_t personHandle = self->_personHandle;
    if (v8 == INPersonHandleTypePhoneNumber)
    {
      [(INPersonHandle *)personHandle value];
      uint64_t v10 = (NSString *)PNCreateFormattedStringWithCountry();

      if ([(NSString *)v10 length])
      {
        unint64_t v3 = v10;
        goto LABEL_11;
      }
      uint64_t personHandle = self->_personHandle;
    }
    else
    {
      uint64_t v10 = v3;
    }
    unint64_t v3 = [(INPersonHandle *)personHandle value];
  }
LABEL_11:
  if (v3) {
    char v11 = (__CFString *)v3;
  }
  else {
    char v11 = &stru_1EDA6DB28;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)setHandle:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [[INPersonHandle alloc] initWithValue:v4 type:0];

  [(INPerson *)self setPersonHandle:v5];
}

- (NSString)handle
{
  v2 = [(INPerson *)self personHandle];
  unint64_t v3 = [v2 value];

  return (NSString *)v3;
}

- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier
{
  uint64_t v12 = contactIdentifier;
  uint64_t v13 = image;
  NSUInteger v14 = displayName;
  uint64_t v15 = nameComponents;
  uint64_t v16 = handle;
  uint64_t v17 = [[INPersonHandle alloc] initWithValue:v16 type:0];

  unint64_t v18 = [(INPerson *)self initWithPersonHandle:v17 nameComponents:v15 displayName:v14 image:v13 contactIdentifier:v12 customIdentifier:0];
  return v18;
}

- (INPerson)initWithHandle:(NSString *)handle displayName:(NSString *)displayName contactIdentifier:(NSString *)contactIdentifier
{
  return [(INPerson *)self initWithHandle:handle nameComponents:0 displayName:displayName image:0 contactIdentifier:contactIdentifier];
}

- (INPerson)initWithHandle:(NSString *)handle nameComponents:(NSPersonNameComponents *)nameComponents contactIdentifier:(NSString *)contactIdentifier
{
  return [(INPerson *)self initWithHandle:handle nameComponents:nameComponents displayName:0 image:0 contactIdentifier:contactIdentifier];
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe suggestionType:(INPersonSuggestionType)suggestionType
{
  LOBYTE(v14) = isMe;
  uint64_t v10 = [(INPerson *)self initWithPersonHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:contactIdentifier customIdentifier:customIdentifier isMe:v14];
  char v11 = v10;
  if (v10)
  {
    v10->_int64_t suggestionType = suggestionType;
    uint64_t v12 = v10;
  }

  return v11;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isContactSuggestion:(BOOL)isContactSuggestion suggestionType:(INPersonSuggestionType)suggestionType
{
  LOBYTE(v14) = 0;
  uint64_t v10 = [(INPerson *)self initWithPersonHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:contactIdentifier customIdentifier:customIdentifier isMe:v14];
  char v11 = v10;
  if (v10)
  {
    v10->_contactSuggestion = isContactSuggestion;
    v10->_int64_t suggestionType = suggestionType;
    uint64_t v12 = v10;
  }

  return v11;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier relationship:(INPersonRelationship)relationship
{
  uint64_t v16 = relationship;
  LOBYTE(v22) = 0;
  uint64_t v17 = [(INPerson *)self initWithPersonHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:contactIdentifier customIdentifier:customIdentifier isMe:v22];
  if (v17)
  {
    uint64_t v18 = [(NSString *)v16 copy];
    id v19 = v17->_relationship;
    v17->_relationship = (NSString *)v18;

    id v20 = v17;
  }

  return v17;
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier
{
  LOBYTE(v9) = 0;
  return [(INPerson *)self initWithPersonHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:contactIdentifier customIdentifier:customIdentifier isMe:v9];
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier isMe:(BOOL)isMe
{
  uint64_t v15 = personHandle;
  uint64_t v16 = nameComponents;
  uint64_t v17 = displayName;
  uint64_t v18 = image;
  id v19 = contactIdentifier;
  id v20 = customIdentifier;
  v35.receiver = self;
  v35.super_class = (Class)INPerson;
  uint64_t v21 = [(INPerson *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [(INPersonHandle *)v15 copy];
    uint64_t v23 = v21->_personHandle;
    v21->_uint64_t personHandle = (INPersonHandle *)v22;

    uint64_t v24 = [(NSPersonNameComponents *)v16 copy];
    id v25 = v21->_nameComponents;
    v21->_uint64_t nameComponents = (NSPersonNameComponents *)v24;

    uint64_t v26 = [(NSString *)v17 copy];
    uint64_t v27 = v21->_displayName;
    v21->_displayName = (NSString *)v26;

    uint64_t v28 = [(INImage *)v18 copy];
    id v29 = v21->_image;
    v21->_image = (INImage *)v28;

    uint64_t v30 = [(NSString *)v19 copy];
    id v31 = v21->_contactIdentifier;
    v21->_contactIdentifier = (NSString *)v30;

    uint64_t v32 = [(NSString *)v20 copy];
    uint64_t v33 = v21->_customIdentifier;
    v21->_customIdentifier = (NSString *)v32;

    v21->_BOOL isMe = isMe;
    v21->_int64_t suggestionType = 0;
    v21->_contactSuggestion = 0;
    v21->_searchProvider = 0;
  }

  return v21;
}

+ (id)toNilScoredPersons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          char v11 = [INScoredPerson alloc];
          uint64_t v12 = -[INScoredPerson initWithPerson:score:](v11, "initWithPerson:score:", v10, 0, (void)v15);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v13 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)expectedCNContactKeys
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v2 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    id v3 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v3, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr = v37[3];
    v2 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v2) {
    goto LABEL_31;
  }
  id v4 = *v2;
  v40[0] = v4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v5 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v6 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v6, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr = v37[3];
    id v5 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v5) {
    goto LABEL_31;
  }
  id v7 = *v5;
  v40[1] = v7;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v8 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr)
  {
    uint64_t v9 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v9, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr = v37[3];
    uint64_t v8 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v8) {
    goto LABEL_31;
  }
  id v10 = *v8;
  v40[2] = v10;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v11 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v12 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v12, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr = v37[3];
    char v11 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v11) {
    goto LABEL_31;
  }
  id v13 = *v11;
  v40[3] = v13;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v14 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    long long v15 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v15, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr = v37[3];
    uint64_t v14 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v14) {
    goto LABEL_31;
  }
  id v16 = *v14;
  v40[4] = v16;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  long long v17 = (id *)getCNContactNicknameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactNicknameKeySymbolLoc_ptr;
  if (!getCNContactNicknameKeySymbolLoc_ptr)
  {
    long long v18 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v18, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr = v37[3];
    long long v17 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v17) {
    goto LABEL_31;
  }
  id v19 = *v17;
  v40[5] = v19;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v20 = (id *)getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactPhoneticGivenNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v21 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v21, "CNContactPhoneticGivenNameKey");
    getCNContactPhoneticGivenNameKeySymbolLoc_ptr = v37[3];
    uint64_t v20 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v20) {
    goto LABEL_31;
  }
  id v35 = *v20;
  v40[6] = v35;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v22 = (id *)getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactPhoneticMiddleNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticMiddleNameKeySymbolLoc_ptr)
  {
    uint64_t v23 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v23, "CNContactPhoneticMiddleNameKey");
    getCNContactPhoneticMiddleNameKeySymbolLoc_ptr = v37[3];
    uint64_t v22 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v22) {
    goto LABEL_31;
  }
  id v24 = *v22;
  v40[7] = v24;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v25 = (id *)getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
  uint64_t v39 = getCNContactPhoneticFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPhoneticFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v26 = (void *)ContactsLibrary_33503();
    void v37[3] = (uint64_t)dlsym(v26, "CNContactPhoneticFamilyNameKey");
    getCNContactPhoneticFamilyNameKeySymbolLoc_ptr = v37[3];
    id v25 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v25)
  {
LABEL_31:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  uint64_t v33 = v4;
  id v34 = v7;
  id v41 = *v25;
  id v27 = v41;
  uint64_t v28 = getCNContactPhoneNumbersKey();
  v42 = v28;
  id v29 = getCNContactEmailAddressesKey();
  uint64_t v43 = v29;
  uint64_t v30 = getCNContactIdentifierKey();
  id v44 = v30;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:12];

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPerson;
  uint64_t v6 = [(INPerson *)&v11 description];
  id v7 = [(INPerson *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPerson *)self descriptionAtIndent:0];
}

- (INPerson)initWithPersonHandle:(INPersonHandle *)personHandle nameComponents:(NSPersonNameComponents *)nameComponents displayName:(NSString *)displayName image:(INImage *)image contactIdentifier:(NSString *)contactIdentifier customIdentifier:(NSString *)customIdentifier aliases:(NSArray *)aliases suggestionType:(INPersonSuggestionType)suggestionType
{
  LOBYTE(v12) = 0;
  LOBYTE(v11) = 0;
  return (INPerson *)[(INPerson *)self _initWithUserInput:0 personHandle:personHandle nameComponents:nameComponents displayName:displayName image:image contactIdentifier:contactIdentifier customIdentifier:customIdentifier relationship:0 aliases:aliases suggestionType:suggestionType isMe:v11 alternatives:0 sourceAppBundleIdentifier:0 phonemeData:0 isContactSuggestion:v12];
}

- (BOOL)_intents_compareValue:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke;
  v54[3] = &unk_1E5518AB8;
  v54[4] = self;
  id v7 = v6;
  id v55 = v7;
  uint64_t v8 = MEMORY[0x192F984C0](v54);
  uint64_t v9 = (uint64_t (**)(void))v8;
  switch(a4)
  {
    case 1uLL:
      LOBYTE(self) = 1;
      break;
    case 2uLL:
      LOBYTE(self) = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8);
      break;
    case 3uLL:
      LODWORD(self) = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8) ^ 1;
      break;
    case 4uLL:
      id v10 = [(INPerson *)self displayName];
      id v11 = v7;
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      id v24 = v12;

      id v25 = [v24 displayName];

      BOOL v26 = [v10 compare:v25] == 1;
      goto LABEL_44;
    case 5uLL:
      id v10 = [(INPerson *)self displayName];
      id v13 = v7;
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v27 = v14;

      id v28 = [v27 displayName];

      if ([v10 compare:v28] == 1) {
        goto LABEL_38;
      }
      goto LABEL_50;
    case 6uLL:
      id v10 = [(INPerson *)self displayName];
      id v15 = v7;
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v30 = v16;

      id v25 = [v30 displayName];

      BOOL v26 = [v10 compare:v25] == -1;
LABEL_44:
      LOBYTE(self) = v26;

      goto LABEL_78;
    case 7uLL:
      id v10 = [(INPerson *)self displayName];
      id v17 = v7;
      if (v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v18 = v17;
        }
        else {
          long long v18 = 0;
        }
      }
      else
      {
        long long v18 = 0;
      }
      id v31 = v18;

      id v28 = [v31 displayName];

      if ([v10 compare:v28] == -1) {
LABEL_38:
      }
        LOBYTE(self) = 1;
      else {
LABEL_50:
      }
        LOBYTE(self) = v9[2](v9);
      goto LABEL_77;
    case 8uLL:
      id v19 = v7;
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      id v10 = v20;

      objc_msgSend(v10, "if_flatMap:", &__block_literal_global_40639);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = [(INPerson *)self contactIdentifier];
      if ([v28 containsObject:v29]) {
        goto LABEL_59;
      }
      id v32 = v19;
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v33 = v32;
        }
        else {
          uint64_t v33 = 0;
        }
      }
      else
      {
        uint64_t v33 = 0;
      }
      id v40 = v33;

      uint64_t v41 = objc_msgSend(v40, "if_flatMap:", &__block_literal_global_4);
      uint64_t v42 = [(INPerson *)self customIdentifier];
      uint64_t v53 = (void *)v41;
      uint64_t v43 = (void *)v41;
      id v44 = (void *)v42;
      if ([v43 containsObject:v42])
      {
        LOBYTE(self) = 1;
      }
      else
      {
        id v45 = v32;
        id v52 = v40;
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v46 = v45;
          }
          else {
            long long v46 = 0;
          }
        }
        else
        {
          long long v46 = 0;
        }
        id v47 = v46;

        long long v48 = objc_msgSend(v47, "if_flatMap:", &__block_literal_global_6);

        uint64_t v49 = [(INPerson *)self personHandle];
        long long v50 = [v49 value];
        LOBYTE(self) = [v48 containsObject:v50];

        id v40 = v52;
      }

      goto LABEL_76;
    case 9uLL:
      id v10 = [(INPerson *)self displayName];
      id v21 = v7;
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
      }
      else
      {
        uint64_t v22 = 0;
      }
      id v28 = v22;

      id v29 = [v28 displayName];
      if ([v10 containsString:v29]) {
        goto LABEL_59;
      }
      goto LABEL_60;
    case 0xAuLL:
      id v10 = [(INPerson *)self displayName];
      id v21 = v7;
      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v23 = v21;
        }
        else {
          uint64_t v23 = 0;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
      id v28 = v23;

      id v29 = [v28 displayName];
      if ([v10 containsString:v29])
      {
LABEL_60:
        id v34 = [(INPerson *)self personHandle];
        id v35 = [v34 value];
        self = (INPerson *)v21;
        if (v21)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v36 = self;
          }
          else {
            uint64_t v36 = 0;
          }
        }
        else
        {
          uint64_t v36 = 0;
        }
        uint64_t v37 = v36;

        uint64_t v38 = [(INPerson *)v37 personHandle];

        uint64_t v39 = [v38 value];
        LOBYTE(self) = [v35 containsString:v39];
      }
      else
      {
LABEL_59:
        LOBYTE(self) = 1;
      }
LABEL_76:

LABEL_77:
LABEL_78:

      break;
    default:
      LOBYTE(self) = 0;
      break;
  }

  return (char)self;
}

uint64_t __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  id v3 = *(id *)(a1 + 40);
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 contactIdentifier];
  if ([v2 isEqualToString:v6])
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) customIdentifier];
    id v9 = *(id *)(a1 + 40);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 customIdentifier];
    if ([v8 isEqualToString:v12])
    {
      uint64_t v7 = 1;
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) customIdentifier];
      id v14 = *(id *)(a1 + 40);
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
      id v16 = v15;

      id v17 = [v16 customIdentifier];
      if ([v13 isEqualToString:v17])
      {
        uint64_t v7 = 1;
      }
      else
      {
        id v25 = [*(id *)(a1 + 32) personHandle];
        id v24 = [v25 value];
        id v18 = *(id *)(a1 + 40);
        id v26 = v16;
        id v27 = v13;
        if (v18)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v19 = v18;
          }
          else {
            id v19 = 0;
          }
        }
        else
        {
          id v19 = 0;
        }
        id v20 = v19;

        id v21 = [v20 personHandle];

        uint64_t v22 = [v21 value];
        uint64_t v7 = [v24 isEqualToString:v22];

        id v16 = v26;
        id v13 = v27;
      }
    }
  }

  return v7;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [a2 personHandle];
  id v4 = [v3 value];
  id v5 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v4);

  return v5;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [a2 customIdentifier];
  id v4 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);

  return v4;
}

id __80__INPerson_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [a2 contactIdentifier];
  id v4 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);

  return v4;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)[(INPerson *)self copy];
    id v9 = [(INPerson *)self image];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__INPerson_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
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

uint64_t __70__INPerson_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setImage:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)_intents_indexingRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(INPerson *)self contactIdentifier];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v9 = @"contactIdentifier";
    id v5 = [(INPerson *)self contactIdentifier];
    v10[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v5 = [(INPerson *)self _dictionaryRepresentation];
    uint64_t v6 = objc_msgSend(v5, "_intents_indexingRepresentation");
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)spokenPhrases
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(INPerson *)self spokenPhrase];
  [v3 addObject:v4];

  id v5 = [(INPerson *)self nameComponents];
  uint64_t v6 = [v5 givenName];

  if (v6)
  {
    id v7 = [(INPerson *)self nameComponents];
    uint64_t v8 = [v7 givenName];
    [v3 addObject:v8];
  }
  id v9 = [(INPerson *)self nameComponents];
  id v10 = [v9 familyName];

  if (v10)
  {
    id v11 = [(INPerson *)self nameComponents];
    uint64_t v12 = [v11 familyName];
    [v3 addObject:v12];
  }
  id v13 = [(INPerson *)self nameComponents];
  id v14 = [v13 nickname];

  if (v14)
  {
    id v15 = [(INPerson *)self nameComponents];
    id v16 = [v15 nickname];
    [v3 addObject:v16];
  }

  return v3;
}

@end