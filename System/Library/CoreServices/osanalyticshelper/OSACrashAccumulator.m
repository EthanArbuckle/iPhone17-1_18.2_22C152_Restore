@interface OSACrashAccumulator
- (BOOL)isValidEvent:(id)a3;
- (NSSet)firstPartyBundleIDs;
- (OSACrashAccumulator)initWithTargetAppVersions:(id)a3 isBaseline:(BOOL)a4;
- (void)addEvent:(id)a3 withBundleID:(id)a4;
@end

@implementation OSACrashAccumulator

- (OSACrashAccumulator)initWithTargetAppVersions:(id)a3 isBaseline:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OSACrashAccumulator;
  v8 = [(OSAAccumulator *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_isBaseline = a4;
    objc_storeStrong((id *)&v8->_targetAppVersions, a3);
    if (a4)
    {
      v10 = 0;
    }
    else
    {
      v10 = +[NSMutableSet set];
    }
    objc_storeStrong((id *)&v9->_firstPartyBundleIDs, v10);
    if (!a4) {

    }
    uint64_t v11 = +[NSSet setWithObjects:@"0xdead10cc", @"0x2bad45ec", @"0x8badf00d", 0];
    terminationReasonCodeDenyList = v9->_terminationReasonCodeDenyList;
    v9->_terminationReasonCodeDenyList = (NSSet *)v11;
  }
  return v9;
}

- (NSSet)firstPartyBundleIDs
{
  if (self->_firstPartyBundleIDs)
  {
    v2 = +[NSSet setWithSet:](NSSet, "setWithSet:");
  }
  else
  {
    v2 = 0;
  }

  return (NSSet *)v2;
}

- (BOOL)isValidEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventBody];
  v6 = [v5 terminationReason];
  id v7 = [v6 namespaceName];
  if ([v7 isEqualToString:@"LIBXPC"])
  {
    v8 = [v4 eventBody];
    v9 = [v8 terminationReason];
    v10 = [v9 code];
    unsigned __int8 v11 = [v10 isEqualToString:@"0x3"];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  v12 = [v4 eventBody];
  LOBYTE(v6) = 0;
  if (([v12 isBeta] & 1) == 0 && (v11 & 1) == 0)
  {
    terminationReasonCodeDenyList = self->_terminationReasonCodeDenyList;
    objc_super v14 = [v4 eventBody];
    v15 = [v14 terminationReason];
    v16 = [v15 code];
    LODWORD(v6) = ![(NSSet *)terminationReasonCodeDenyList containsObject:v16];
  }
  return (char)v6;
}

- (void)addEvent:(id)a3 withBundleID:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v18 eventBody];
  v8 = [v7 appVersion];
  v9 = [v18 eventBody];
  v10 = [v9 bundleVersion];
  unsigned __int8 v11 = sub_10000DBBC((uint64_t)v8, (uint64_t)v10);

  v12 = [(NSDictionary *)self->_targetAppVersions objectForKeyedSubscript:v6];
  v13 = [(OSAAccumulator *)self targetKey];
  if (v13)
  {
    v9 = [(OSAAccumulator *)self targetKey];
    if (![v9 isEqualToString:v6]) {
      goto LABEL_18;
    }
  }
  unsigned int v14 = [(OSACrashAccumulator *)self isValidEvent:v18];
  if (v11) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15 && ([v11 isEqualToString:v12] & 1) == 0)
  {
    v16 = [v18 eventBody];
    if (![v16 isFirstParty])
    {

      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
    BOOL v15 = !self->_isBaseline;
  }
  if (!v13)
  {

    if (!v15) {
      goto LABEL_20;
    }
LABEL_14:
    [v18 timestamp];
    v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [(OSAAccumulator *)self addUnsignedInteger:1 forKey:v6 onDate:v13];
    v9 = [v18 eventBody];
    if ([v9 isFirstParty])
    {
      BOOL isBaseline = self->_isBaseline;

      if (!isBaseline) {
        [(NSMutableSet *)self->_firstPartyBundleIDs addObject:v6];
      }
      goto LABEL_19;
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }

  if (v15) {
    goto LABEL_14;
  }
LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationReasonCodeDenyList, 0);
  objc_storeStrong((id *)&self->_firstPartyBundleIDs, 0);

  objc_storeStrong((id *)&self->_targetAppVersions, 0);
}

@end