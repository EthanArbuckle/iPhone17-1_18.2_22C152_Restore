@interface SGQuickResponsesEngagementDeltas
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuickResponsesEngagementDeltas:(id)a3;
- (NSString)lang;
- (NSString)response;
- (SGQuickResponsesEngagementDeltas)initWithCoder:(id)a3;
- (SGQuickResponsesEngagementDeltas)initWithLangResponse:(id)a3 displayed:(int)a4 selected:(int)a5 matched:(int)a6;
- (int)displayed;
- (int)matched;
- (int)selected;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGQuickResponsesEngagementDeltas

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (int)matched
{
  return self->_matched;
}

- (int)selected
{
  return self->_selected;
}

- (int)displayed
{
  return self->_displayed;
}

- (NSString)lang
{
  return self->_lang;
}

- (NSString)response
{
  return self->_response;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGQuickResponsesEngagementDeltas *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGQuickResponsesEngagementDeltas *)self isEqualToQuickResponsesEngagementDeltas:v5];

  return v6;
}

- (BOOL)isEqualToQuickResponsesEngagementDeltas:(id)a3
{
  v4 = (id *)a3;
  response = self->_response;
  BOOL v6 = (NSString *)v4[3];
  if (response == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = response;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_12:
      BOOL v18 = 0;
      goto LABEL_13;
    }
  }
  lang = self->_lang;
  v11 = (NSString *)v4[4];
  if (lang == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = lang;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }
  int displayed = self->_displayed;
  if (displayed != [v4 displayed]) {
    goto LABEL_12;
  }
  int selected = self->_selected;
  if (selected != [v4 selected]) {
    goto LABEL_12;
  }
  int matched = self->_matched;
  BOOL v18 = matched == [v4 matched];
LABEL_13:

  return v18;
}

- (SGQuickResponsesEngagementDeltas)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGQuickResponsesEngagementDeltas;
  v5 = [(SGQuickResponsesEngagementDeltas *)&v13 init];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"response"];
    response = v5->_response;
    v5->_response = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"lang"];
    lang = v5->_lang;
    v5->_lang = (NSString *)v10;

    v5->_int displayed = [v4 decodeInt32ForKey:@"displayed"];
    v5->_int selected = [v4 decodeInt32ForKey:@"selected"];
    v5->_int matched = [v4 decodeInt32ForKey:@"matched"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  response = self->_response;
  id v5 = a3;
  [v5 encodeObject:response forKey:@"response"];
  [v5 encodeObject:self->_lang forKey:@"lang"];
  [v5 encodeInt32:self->_displayed forKey:@"displayed"];
  [v5 encodeInt32:self->_selected forKey:@"selected"];
  [v5 encodeInt32:self->_matched forKey:@"matched"];
}

- (SGQuickResponsesEngagementDeltas)initWithLangResponse:(id)a3 displayed:(int)a4 selected:(int)a5 matched:(int)a6
{
  id v11 = a3;
  if (v11)
  {
    if ((a4 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1336, @"Invalid parameter not satisfying: %@", @"langResponse" object file lineNumber description];

    if ((a4 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a5 & 0x80000000) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1338, @"Invalid parameter not satisfying: %@", @"selected >= 0" object file lineNumber description];

      if ((a6 & 0x80000000) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1337, @"Invalid parameter not satisfying: %@", @"displayed >= 0" object file lineNumber description];

  if (a5 < 0) {
    goto LABEL_12;
  }
LABEL_4:
  if ((a6 & 0x80000000) == 0) {
    goto LABEL_5;
  }
LABEL_13:
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1339, @"Invalid parameter not satisfying: %@", @"matched >= 0" object file lineNumber description];

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)SGQuickResponsesEngagementDeltas;
  v12 = [(SGQuickResponsesEngagementDeltas *)&v23 init];
  if (v12)
  {
    objc_super v13 = [v11 componentsSeparatedByString:@"|"];
    uint64_t v14 = [v13 count];
    uint64_t v15 = [v13 objectAtIndexedSubscript:0];
    if (v14 != 1)
    {
      lang = v12->_lang;
      v12->_lang = (NSString *)v15;

      uint64_t v15 = [v13 objectAtIndexedSubscript:1];
    }
    response = v12->_response;
    v12->_response = (NSString *)v15;

    v12->_int displayed = a4;
    v12->_int selected = a5;
    v12->_int matched = a6;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end