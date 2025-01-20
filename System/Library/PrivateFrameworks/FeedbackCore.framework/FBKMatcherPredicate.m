@interface FBKMatcherPredicate
+ (NSDateComponentsFormatter)shortDateFormatter;
+ (NSDateComponentsFormatter)shortestDateFormatter;
- (BOOL)collectsSameDiagnosticsAsOtherMatcher:(id)a3;
- (BOOL)hasCachedLocalizedDataFromExtension;
- (BOOL)hasRegularExpression;
- (BOOL)isAdditional;
- (BOOL)isConfiguredWithDEBundleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresRemote;
- (BOOL)shouldAutoGather;
- (FBKFileMatcher)fileMatcher;
- (FBKFilePredicate)filePredicate;
- (FBKMatcherPredicate)initWithFileMatcher:(id)a3 filePredicate:(id)a4;
- (NSString)deBundleIdentifier;
- (NSString)description;
- (NSString)hashingKey;
- (NSString)localizedDataCollectedExplanation;
- (NSString)localizedDataCollectedSummary;
- (NSString)localizedWhenItWillGather;
- (NSString)name;
- (NSString)platform;
- (NSString)shortDescription;
- (int64_t)hash;
- (void)setFileMatcher:(id)a3;
- (void)setFilePredicate:(id)a3;
- (void)setIsAdditional:(BOOL)a3;
@end

@implementation FBKMatcherPredicate

- (FBKMatcherPredicate)initWithFileMatcher:(id)a3 filePredicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKMatcherPredicate;
  v9 = [(FBKMatcherPredicate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileMatcher, a3);
    objc_storeStrong((id *)&v10->_filePredicate, a4);
  }

  return v10;
}

- (FBKFilePredicate)filePredicate
{
  return self->_filePredicate;
}

- (void)setFilePredicate:(id)a3
{
}

- (FBKFileMatcher)fileMatcher
{
  return self->_fileMatcher;
}

- (void)setFileMatcher:(id)a3
{
}

- (BOOL)isAdditional
{
  return self->_isAdditional;
}

- (void)setIsAdditional:(BOOL)a3
{
  self->_isAdditional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMatcher, 0);

  objc_storeStrong((id *)&self->_filePredicate, 0);
}

- (NSString)localizedWhenItWillGather
{
  v3 = [(FBKMatcherPredicate *)self filePredicate];
  uint64_t v4 = [v3 enhancedLoggingDuration];

  if (v4)
  {
    v5 = +[FBKMatcherPredicate shortDateFormatter];
    v6 = [(FBKMatcherPredicate *)self filePredicate];
    id v7 = objc_msgSend(v5, "stringFromTimeInterval:", (double)objc_msgSend(v6, "enhancedLoggingDuration"));

    id v8 = [MEMORY[0x263F086E0] FeedbackCore];
    v9 = [v8 localizedStringForKey:@"GATHER_IN" value:@"In %@" table:0];

    objc_msgSend(NSString, "stringWithFormat:", v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_26DDF6A30;
  }

  return (NSString *)v10;
}

- (NSString)localizedDataCollectedSummary
{
  return (NSString *)sub_22A43CFFC(self, (uint64_t)a2, (SEL *)&selRef_localizedDataCollectedSummary);
}

- (NSString)localizedDataCollectedExplanation
{
  return (NSString *)sub_22A43CFFC(self, (uint64_t)a2, (SEL *)&selRef_localizedDataCollectedExplanation);
}

- (BOOL)hasCachedLocalizedDataFromExtension
{
  v2 = self;
  v3 = [(FBKMatcherPredicate *)v2 localizedDataCollectedSummary];
  if (v3)
  {

    uint64_t v4 = [(FBKMatcherPredicate *)v2 localizedDataCollectedExplanation];
    if (!v4) {
      return 0;
    }
    BOOL v5 = 1;
    v2 = v4;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)requiresRemote
{
  return sub_22A43D27C(self, (uint64_t)a2, (SEL *)&selRef_requiresRemote);
}

- (BOOL)isConfiguredWithDEBundleIdentifier
{
  v2 = self;
  v3 = [(FBKMatcherPredicate *)v2 deBundleIdentifier];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_22A4B3458();
    unint64_t v7 = v6;

    swift_bridgeObjectRelease();
    uint64_t v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    }
    return v8 != 0;
  }
  else
  {

    return 0;
  }
}

- (BOOL)hasRegularExpression
{
  v2 = self;
  BOOL v3 = FBKMatcherPredicate.hasRegularExpression.getter();

  return v3;
}

- (NSString)deBundleIdentifier
{
  return (NSString *)sub_22A43CFFC(self, (uint64_t)a2, (SEL *)&selRef_deBundleIdentifier);
}

- (NSString)name
{
  return (NSString *)sub_22A43CFFC(self, (uint64_t)a2, (SEL *)&selRef_name);
}

- (NSString)platform
{
  v2 = self;
  BOOL v3 = [(FBKMatcherPredicate *)v2 fileMatcher];
  id v4 = [(FBKFileMatcher *)v3 platform];

  if (v4)
  {
    sub_22A4B3458();

    unint64_t v6 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
    return (NSString *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)shouldAutoGather
{
  return sub_22A43D27C(self, (uint64_t)a2, (SEL *)&selRef_alwaysRequired);
}

- (NSString)description
{
  return (NSString *)sub_22A43DFEC(self, (uint64_t)a2, FBKMatcherPredicate.description.getter);
}

- (NSString)shortDescription
{
  return (NSString *)sub_22A43DFEC(self, (uint64_t)a2, (void (*)(void))FBKMatcherPredicate.shortDescription.getter);
}

- (BOOL)collectsSameDiagnosticsAsOtherMatcher:(id)a3
{
  id v4 = (objc_class *)a3;
  uint64_t v5 = self;
  v7.super.isa = v4;
  LOBYTE(self) = FBKMatcherPredicate.collectsSameDiagnosticsAs(otherMatcher:)(v7);

  return self & 1;
}

+ (NSDateComponentsFormatter)shortestDateFormatter
{
  return (NSDateComponentsFormatter *)sub_22A4123F8((uint64_t)a1, (uint64_t)a2, &qword_268375C50, (void **)&qword_268376628);
}

+ (NSDateComponentsFormatter)shortDateFormatter
{
  return (NSDateComponentsFormatter *)sub_22A4123F8((uint64_t)a1, (uint64_t)a2, &qword_268375C58, (void **)&qword_268376630);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_22A4B3968();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = FBKMatcherPredicate.isEqual(_:)((uint64_t)v8);

  sub_22A40A904((uint64_t)v8);
  return v6 & 1;
}

- (NSString)hashingKey
{
  return (NSString *)sub_22A43DFEC(self, (uint64_t)a2, FBKMatcherPredicate.hashingKey.getter);
}

- (int64_t)hash
{
  v2 = self;
  BOOL v3 = [(FBKMatcherPredicate *)v2 fileMatcher];
  unsigned int v4 = [(FBKFileMatcher *)v3 hash];

  uint64_t v5 = [(FBKMatcherPredicate *)v2 filePredicate];
  unsigned int v6 = [(FBKFilePredicate *)v5 hash];

  LODWORD(v5) = [(FBKMatcherPredicate *)v2 isAdditional];
  return v6 & v4 & v5;
}

@end