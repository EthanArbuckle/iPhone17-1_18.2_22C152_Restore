@interface _DKQuery
+ (BOOL)supportsSecureCoding;
+ (id)creationDateSortDescriptorAscending:(BOOL)a3;
+ (id)endDateSortDescriptorAscending:(BOOL)a3;
+ (id)executableQueryForQuery:(id)a3;
+ (id)localCreationDateSortDescriptorAscending:(BOOL)a3;
+ (id)predicateForEventsBetweenStartSecondOfDay:(unint64_t)a3 endSecondOfDay:(unint64_t)a4;
+ (id)predicateForEventsContainingDateRangeFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsExcludingIntegerValue:(int64_t)a3;
+ (id)predicateForEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithBundleID:(id)a3;
+ (id)predicateForEventsWithCategoryValue:(id)a3;
+ (id)predicateForEventsWithCreationInDateRangeFrom:(id)a3 toBefore:(id)a4;
+ (id)predicateForEventsWithCreationInDateRangeFromAfter:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithDayOfWeek:(unint64_t)a3;
+ (id)predicateForEventsWithDoubleValue:(double)a3;
+ (id)predicateForEventsWithDoubleValueBetween:(double)a3 and:(double)a4;
+ (id)predicateForEventsWithEndInDateRangeFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithIdentifierValue:(id)a3;
+ (id)predicateForEventsWithIntegerValue:(int64_t)a3;
+ (id)predicateForEventsWithLocalCreationInDateRangeFrom:(id)a3 toBefore:(id)a4;
+ (id)predicateForEventsWithLocalCreationInDateRangeFromAfter:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithMinimumDuration:(double)a3;
+ (id)predicateForEventsWithNoSource;
+ (id)predicateForEventsWithNullSourceDeviceID;
+ (id)predicateForEventsWithQuantityValue:(id)a3;
+ (id)predicateForEventsWithSourceDeviceIDs:(id)a3;
+ (id)predicateForEventsWithSourceGroupIDs:(id)a3;
+ (id)predicateForEventsWithSourceID:(id)a3;
+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4;
+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 groupIDs:(id)a5;
+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 itemIDs:(id)a5;
+ (id)predicateForEventsWithStartAndEndInDateRangeFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithStartDateAfter:(id)a3;
+ (id)predicateForEventsWithStartDateOrCreationDateBefore:(id)a3;
+ (id)predicateForEventsWithStartInDateRangeFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithStartInDateRangeFromAfter:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithStartOrEndInDateRangeWithFrom:(id)a3 to:(id)a4;
+ (id)predicateForEventsWithStreamName:(id)a3;
+ (id)predicateForEventsWithStreamNames:(id)a3;
+ (id)predicateForEventsWithStringValue:(id)a3;
+ (id)predicateForEventsWithStringValueInValues:(id)a3;
+ (id)predicateForObjectWithUUID:(id)a3;
+ (id)predicateForObjectsWithMetadataKey:(id)a3;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValue:(double)a4;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValueBetween:(double)a4 andValue:(double)a5;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 andIntegerValue:(int64_t)a4;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 andStringValue:(id)a4;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 andValue:(id)a4;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 inValues:(id)a4;
+ (id)predicateForObjectsWithMetadataKey:(id)a3 likeStringValue:(id)a4;
+ (id)predicateForObjectsWithStructuredMetadataKey:(void *)a3 andValue:;
+ (id)predicateForObjectsWithUUIDs:(id)a3;
+ (id)predicateForSpotlightEventsWithBundleID:(uint64_t)a1;
+ (id)predicateForSpotlightEventsWithBundleID:(void *)a3 sinceDate:;
+ (id)predicateForSpotlightEventsWithDomainIdentifiers:(void *)a3 bundleID:;
+ (id)predicateForSpotlightEventsWithItemIdentifiers:(void *)a3 bundleID:;
+ (id)queryNotExecutableError;
+ (id)startDateSortDescriptorAscending:(BOOL)a3;
+ (id)structuredMetadataKeyPathForMetadataKey:(id)a3;
- (BOOL)executeConcurrently;
- (NSString)clientName;
- (_DKQuery)initWithCoder:(id)a3;
- (id)description;
- (id)tracker;
- (void)encodeWithCoder:(id)a3;
- (void)setClientName:(id)a3;
- (void)setExecuteConcurrently:(BOOL)a3;
- (void)setTracker:(id)a3;
@end

@implementation _DKQuery

+ (id)predicateForEventsWithNullSourceDeviceID
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"source == NULL || source.deviceID == NULL"];
}

+ (id)predicateForEventsWithSourceGroupIDs:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v3;
    id obj = v3;
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    unint64_t v7 = 0x1E4F28000uLL;
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.groupID BEGINSWITH %@", *(void *)(*((void *)&v21 + 1) + 8 * i)];
          [v5 addObject:v11];

          if ((unint64_t)[v5 count] >= 0x385)
          {
            v12 = [*(id *)(v7 + 2976) orPredicateWithSubpredicates:v5];
            [v4 addObject:v12];
            [MEMORY[0x1E4F1CA48] array];
            v13 = v4;
            v15 = unint64_t v14 = v7;

            v5 = (void *)v15;
            unint64_t v7 = v14;
            v4 = v13;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      v16 = [*(id *)(v7 + 2976) orPredicateWithSubpredicates:v5];
      [v4 addObject:v16];
    }
    v17 = [*(id *)(v7 + 2976) orPredicateWithSubpredicates:v4];

    id v3 = v19;
  }
  else
  {
    v17 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v17;
}

+ (id)predicateForSpotlightEventsWithBundleID:(uint64_t)a1
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  self;
  long long v24 = +[_DKSystemEventStreams appActivityStream];
  long long v23 = [v24 name];
  v28[0] = v23;
  long long v22 = +[_DKSystemEventStreams appIntentsStream];
  v2 = [v22 name];
  v28[1] = v2;
  id v3 = +[_DKSystemEventStreams appLocationActivityStream];
  v4 = [v3 name];
  v28[2] = v4;
  v5 = +[_CDPortraitStreams entityStream];
  uint64_t v6 = [v5 name];
  v28[3] = v6;
  unint64_t v7 = +[_CDPortraitStreams topicStream];
  uint64_t v8 = [v7 name];
  v28[4] = v8;
  uint64_t v9 = +[_DKSystemEventStreams safariHistoryStream];
  v10 = [v9 name];
  v28[5] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  long long v21 = +[_DKQuery predicateForEventsWithStreamNames:v11];

  v12 = (void *)MEMORY[0x1E4F28F60];
  v13 = +[_DKSource intentsSourceID];
  v27[0] = v13;
  unint64_t v14 = +[_DKSource spotlightSourceID];
  v27[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v16 = [v12 predicateWithFormat:@"source.bundleID == %@ AND source.sourceID IN %@", v25, v15];

  v17 = (void *)MEMORY[0x1E4F28BA0];
  v26[0] = v21;
  v26[1] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v19 = [v17 andPredicateWithSubpredicates:v18];

  return v19;
}

+ (id)predicateForEventsWithStreamNames:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(streamName IN %@)", a3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tracker, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

+ (id)startDateSortDescriptorAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:a3];
}

- (NSString)clientName
{
  return self->_clientName;
}

- (_DKQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKQuery;
  v5 = [(_DKQuery *)&v9 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = _CDCurrentOrXPCProcessName();
      [(_DKQuery *)v5 setClientName:v6];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
      unint64_t v7 = [v6 processName];
      [(_DKQuery *)v5 setClientName:v7];
    }
    -[_DKQuery setExecuteConcurrently:](v5, "setExecuteConcurrently:", [v4 decodeBoolForKey:@"executeConcurrently"]);
  }

  return v5;
}

- (void)setClientName:(id)a3
{
}

- (void)setExecuteConcurrently:(BOOL)a3
{
  self->_executeConcurrently = a3;
}

+ (id)predicateForSpotlightEventsWithDomainIdentifiers:(void *)a3 bundleID:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v4);

  unint64_t v7 = +[_DKQuery predicateForEventsWithSourceGroupIDs:v5];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v6;
  v12[1] = v7;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateForEventsWithStartDateAfter:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", a3];
}

+ (id)predicateForEventsWithIntegerValue:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"valueInteger = %@", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_DKQuery executeConcurrently](self, "executeConcurrently"), @"executeConcurrently");
}

+ (id)executableQueryForQuery:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1EDE37BD0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)tracker
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)executeConcurrently
{
  return self->_executeConcurrently;
}

+ (id)predicateForObjectWithUUID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [v5 UUIDString];
  unint64_t v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  uint64_t v8 = [v5 UUIDString];

  objc_super v9 = [v3 predicateWithFormat:@"(uuidHash == %@ AND uuid == %@)", v7, v8];

  return v9;
}

+ (id)predicateForObjectsWithUUIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = NSNumber;
        v13 = [v11 UUIDString];
        unint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
        [v4 addObject:v14];

        uint64_t v15 = [v11 UUIDString];
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(uuidHash IN %@ AND uuid IN %@)", v4, v5, (void)v18];

  return v16;
}

+ (id)predicateForEventsWithStartInDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((startDate >= %@) AND (startDate <= %@))", a3, a4];
}

+ (id)predicateForEventsWithStartInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((startDate > %@) AND (startDate <= %@))", a3, a4];
}

+ (id)predicateForEventsWithEndInDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((endDate >= %@) AND (endDate <= %@))", a3, a4];
}

+ (id)predicateForEventsWithStartOrEndInDateRangeWithFrom:(id)a3 to:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 predicateForEventsWithStartInDateRangeFrom:v7 to:v6];
  uint64_t v9 = [a1 predicateForEventsWithEndInDateRangeFrom:v7 to:v6];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v8;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 orPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)predicateForEventsWithStartAndEndInDateRangeFrom:(id)a3 to:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 predicateForEventsWithStartInDateRangeFrom:v7 to:v6];
  uint64_t v9 = [a1 predicateForEventsWithEndInDateRangeFrom:v7 to:v6];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v8;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 andPredicateWithSubpredicates:v11];

  return v12;
}

+ (id)predicateForEventsWithStartDateOrCreationDateBefore:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate < %@ OR startDate < %@", a3, a3];
}

+ (id)predicateForEventsContainingDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((startDate <= %@) AND (endDate >= %@))", a3, a4];
}

+ (id)predicateForEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((startDate <= %@) AND (endDate >= %@))", a4, a3];
}

+ (id)predicateForEventsWithDayOfWeek:(unint64_t)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDayOfWeek == %@ || endDayOfWeek == %@)", v3, v3];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(endDayOfWeek > startDayOfWeek AND  startDayOfWeek < %@ AND  endDayOfWeek > %@)", v3, v3];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(endDayOfWeek < startDayOfWeek AND  startDayOfWeek > %@ AND endDayOfWeek < %@)", v3, v3];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v9 = [v7 orPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForEventsBetweenStartSecondOfDay:(unint64_t)a3 endSecondOfDay:(unint64_t)a4
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [NSNumber numberWithUnsignedInteger:a4];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startSecondOfDay >= %@ AND startSecondOfDay <= %@) OR  (endSecondOfDay >= %@ AND endSecondOfDay <= %@)", v5, v6, v5, v6];

  return v7;
}

+ (id)predicateForEventsWithMinimumDuration:(double)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [NSNumber numberWithDouble:a3];
  id v5 = [v3 predicateWithFormat:@"((endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) >= %@)", v4];

  return v5;
}

+ (id)predicateForEventsWithLocalCreationInDateRangeFrom:(id)a3 toBefore:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((localCreationDate >= %@) AND (localCreationDate < %@))", a3, a4];
}

+ (id)predicateForEventsWithLocalCreationInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((localCreationDate > %@) AND (localCreationDate <= %@))", a3, a4];
}

+ (id)localCreationDateSortDescriptorAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localCreationDate" ascending:a3];
}

+ (id)predicateForEventsWithCreationInDateRangeFrom:(id)a3 toBefore:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((creationDate >= %@) AND (creationDate < %@))", a3, a4];
}

+ (id)predicateForEventsWithCreationInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"((creationDate > %@) AND (creationDate <= %@))", a3, a4];
}

+ (id)predicateForEventsWithStreamName:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(streamName == %@)", a3];
}

+ (id)predicateForEventsWithCategoryValue:(id)a3
{
  uint64_t v4 = [a3 integerValue];
  return (id)[a1 predicateForEventsWithIntegerValue:v4];
}

+ (id)predicateForEventsWithIdentifierValue:(id)a3
{
  uint64_t v4 = [a3 stringValue];
  id v5 = [a1 predicateForEventsWithStringValue:v4];

  return v5;
}

+ (id)predicateForEventsWithQuantityValue:(id)a3
{
  [a3 doubleValue];
  return (id)objc_msgSend(a1, "predicateForEventsWithDoubleValue:");
}

+ (id)predicateForEventsExcludingIntegerValue:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"valueInteger != %@", v4];

  return v5;
}

+ (id)predicateForEventsWithDoubleValue:(double)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [NSNumber numberWithDouble:a3];
  id v5 = [v3 predicateWithFormat:@"valueDouble = %@", v4];

  return v5;
}

+ (id)predicateForEventsWithDoubleValueBetween:(double)a3 and:(double)a4
{
  if (a3 >= a4) {
    double v4 = a4;
  }
  else {
    double v4 = a3;
  }
  if (a3 >= a4) {
    double v5 = a3;
  }
  else {
    double v5 = a4;
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (v4 > 2.22507386e-308)
  {
    id v7 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v8 = [NSNumber numberWithDouble:v4];
    uint64_t v9 = [v7 predicateWithFormat:@"valueDouble >= %@", v8];
    [v6 addObject:v9];
  }
  if (v5 < 1.79769313e308)
  {
    v10 = (void *)MEMORY[0x1E4F28F60];
    v11 = [NSNumber numberWithDouble:v5];
    v12 = [v10 predicateWithFormat:@"valueDouble <= %@", v11];
    [v6 addObject:v12];
  }
  if ([v6 count]) {
    [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
  }
  else {
  v13 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v13;
}

+ (id)predicateForEventsWithStringValue:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  double v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "hash"));
  id v7 = [v3 predicateWithFormat:@"(valueInteger = %@ AND valueString = %@)", v6, v5];

  return v7;
}

+ (id)predicateForEventsWithStringValueInValues:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hash"));
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(valueInteger IN %@ AND valueString IN %@)", v5, v6, (void)v14];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }

  return v12;
}

+ (id)structuredMetadataKeyPathForMetadataKey:(id)a3
{
  id v3 = a3;
  if (v3
    && (+[_DKMetadataPersistenceLookupTable keyToAttribute](),
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    id v6 = [NSString stringWithFormat:@"structuredMetadata.%@", v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 structuredMetadataKeyPathForMetadataKey:v4];
    if (v5) {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", v5);
    }
    else {
    id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY customMetadata.name = %@", v4];
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v6;
}

+ (id)predicateForObjectsWithStructuredMetadataKey:(void *)a3 andValue:
{
  id v4 = a2;
  id v5 = a3;
  id v6 = self;
  if (v4
    && ([v6 structuredMetadataKeyPathForMetadataKey:v4], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = (void *)v7;
    if (v5) {
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", v7, v5];
    }
    else {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", v7, v11);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andValue:(id)a4
{
  id v5 = a3;
  id v6 = +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)_DKQuery, v5, a4);
  if (!v6)
  {
    uint64_t v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_DKQuery predicateForObjectsWithMetadataKey:andValue:]((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v6;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 inValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && [v7 count])
  {
    uint64_t v9 = [a1 structuredMetadataKeyPathForMetadataKey:v6];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", v9, v8];
    }
    else
    {
      uint64_t v11 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_DKQuery predicateForObjectsWithMetadataKey:andValue:]((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andStringValue:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8
    || ([a1 predicateForObjectsWithMetadataKey:v6], id v8 = (id)objc_claimAutoreleasedReturnValue(), !v7))
  {
    id v8 = v8;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = NSString;
    uint64_t v12 = +[_CDHashUtilities md5ForString:v7];
    uint64_t v13 = [v11 stringWithFormat:@"%@S", v12];
    uint64_t v14 = [v10 predicateWithFormat:@"ANY customMetadata.valueHash == %@", v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v8;
    v18[1] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = [v15 andPredicateWithSubpredicates:v16];
  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 likeStringValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 structuredMetadataKeyPathForMetadataKey:v6];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K LIKE %@", v8, v7];
  }
  else
  {
    uint64_t v10 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_DKQuery predicateForObjectsWithMetadataKey:andValue:]((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andIntegerValue:(int64_t)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [NSNumber numberWithInteger:a4];
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8
    || ([a1 predicateForObjectsWithMetadataKey:v6], id v8 = (id)objc_claimAutoreleasedReturnValue(), !a4))
  {
    id v8 = v8;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = NSString;
    uint64_t v12 = [NSNumber numberWithInteger:a4];
    uint64_t v13 = [v11 stringWithFormat:@"%@I", v12];
    uint64_t v14 = [v10 predicateWithFormat:@"ANY customMetadata.valueHash == %@", v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v14;
    v18[1] = v8;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = [v15 andPredicateWithSubpredicates:v16];
  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValue:(double)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [NSNumber numberWithDouble:a4];
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8
    || ([a1 predicateForObjectsWithMetadataKey:v6],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        a4 == 0.0))
  {
    id v8 = v8;
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = NSString;
    uint64_t v12 = [NSNumber numberWithDouble:a4];
    uint64_t v13 = [v11 stringWithFormat:@"%@D", v12];
    uint64_t v14 = [v10 predicateWithFormat:@"ANY customMetadata.valueHash = %@", v13];

    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v18[0] = v14;
    v18[1] = v8;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v9 = [v15 andPredicateWithSubpredicates:v16];
  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValueBetween:(double)a4 andValue:(double)a5
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 predicateForObjectsWithMetadataKey:v8];
  if (a4 >= a5) {
    double v10 = a5;
  }
  else {
    double v10 = a4;
  }
  if (a4 >= a5) {
    a5 = a4;
  }
  uint64_t v11 = [a1 structuredMetadataKeyPathForMetadataKey:v8];

  if (v10 <= 2.22507386e-308)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = [NSNumber numberWithDouble:v10];
    uint64_t v14 = (void *)v13;
    if (!v11)
    {
      uint64_t v15 = [v12 predicateWithFormat:@"ANY customMetadata.doubleValue >= %@", v13];

      if (a5 < 1.79769313e308) {
        goto LABEL_14;
      }
LABEL_18:
      if (v15)
      {
        uint64_t v19 = 0;
        goto LABEL_21;
      }
      goto LABEL_25;
    }
    uint64_t v15 = [v12 predicateWithFormat:@"%K >= %@", v11, v13];
  }
  if (a5 >= 1.79769313e308) {
    goto LABEL_18;
  }
  if (!v11)
  {
LABEL_14:
    long long v18 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v17 = [NSNumber numberWithDouble:a5];
    [v18 predicateWithFormat:@"ANY customMetadata.doubleValue <= %@", v17, v29];
    goto LABEL_15;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v17 = [NSNumber numberWithDouble:a5];
  [v16 predicateWithFormat:@"%K <= %@", v11, v17];
  uint64_t v19 = LABEL_15:;

  if (v15 && v19)
  {
    long long v20 = (void *)MEMORY[0x1E4F28BA0];
    v32[0] = v9;
    v32[1] = v15;
    v32[2] = v19;
    long long v21 = (void *)MEMORY[0x1E4F1C978];
    long long v22 = v32;
    uint64_t v23 = 3;
LABEL_22:
    long long v24 = [v21 arrayWithObjects:v22 count:v23];
    id v25 = [v20 andPredicateWithSubpredicates:v24];

    goto LABEL_26;
  }
  if (v15)
  {
LABEL_21:
    long long v20 = (void *)MEMORY[0x1E4F28BA0];
    v31[0] = v9;
    v31[1] = v15;
    long long v21 = (void *)MEMORY[0x1E4F1C978];
    long long v22 = v31;
    uint64_t v23 = 2;
    goto LABEL_22;
  }
  if (v19)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28BA0];
    v30[0] = v9;
    v30[1] = v19;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v25 = [v26 andPredicateWithSubpredicates:v27];

    goto LABEL_26;
  }
LABEL_25:
  id v25 = v9;
LABEL_26:

  return v25;
}

+ (id)endDateSortDescriptorAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:a3];
}

+ (id)creationDateSortDescriptorAscending:(BOOL)a3
{
  return (id)[MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:a3];
}

+ (id)predicateForEventsWithSourceID:(id)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.sourceID = %@", a3];
  }
  else {
  id v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  return v3;
}

+ (id)predicateForEventsWithBundleID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"source.bundleID = %@", a3];
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    id v7 = [a1 predicateForEventsWithBundleID:a4];
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v13[0] = v7;
    uint64_t v9 = [a1 predicateForEventsWithSourceID:v6];

    v13[1] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    uint64_t v11 = [v8 andPredicateWithSubpredicates:v10];
  }
  else
  {
    uint64_t v11 = [a1 predicateForEventsWithSourceID:v6];
  }
  return v11;
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 groupIDs:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [a1 predicateForEventsWithSourceID:a3 bundleID:a4];
  if ([v8 count])
  {
    double v10 = +[_DKQuery predicateForEventsWithSourceGroupIDs:v8];
    uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
    v15[0] = v9;
    v15[1] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v13 = [v11 andPredicateWithSubpredicates:v12];
  }
  else
  {
    id v13 = v9;
  }

  return v13;
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 itemIDs:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v8 = (void *)MEMORY[0x1E4F28F60];
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = [v8 predicateWithFormat:@"source.itemID IN %@", a5];
    uint64_t v12 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v11;
    id v13 = [a1 predicateForEventsWithSourceID:v10 bundleID:v9];

    v19[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v15 = [v12 andPredicateWithSubpredicates:v14];
  }
  else
  {
    id v16 = a4;
    id v17 = a3;
    uint64_t v15 = [a1 predicateForEventsWithSourceID:v17 bundleID:v16];
  }
  return v15;
}

+ (id)predicateForEventsWithSourceDeviceIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) UUIDString];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.deviceID IN %@", v4];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }

  return v11;
}

+ (id)predicateForEventsWithNoSource
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"source == NULL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

+ (id)queryNotExecutableError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Query is not executable";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.coreduet.knowledge" code:3 userInfo:v3];

  return v4;
}

- (void)setTracker:(id)a3
{
}

+ (id)predicateForSpotlightEventsWithItemIdentifiers:(void *)a3 bundleID:
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = +[_DKSource intentsSourceID];
  v29[0] = v7;
  uint64_t v8 = +[_DKSource spotlightSourceID];
  v29[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v10 = [v6 predicateWithFormat:@"source.itemID IN %@ AND source.bundleID == %@ AND source.sourceID IN %@", v4, v5, v9];

  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, 0);
  unint64_t v12 = 0x1E4F28000;
  if (v4 && v5 && [v4 count])
  {
    long long v13 = +[_DKSystemEventStreams appActivityStream];
    long long v14 = [v13 name];
    v28[0] = v14;
    long long v15 = +[_DKSystemEventStreams appLocationActivityStream];
    long long v16 = [v15 name];
    v28[1] = v16;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

    id v17 = +[_DKQuery predicateForEventsWithStreamNames:v26];
    uint64_t v18 = +[_DKQuery predicateForEventsWithStringValue:v5];
    uint64_t v19 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
    long long v20 = +[_DKQuery predicateForObjectsWithMetadataKey:v19 inValues:v4];
    long long v21 = (void *)MEMORY[0x1E4F28BA0];
    v27[0] = v17;
    v27[1] = v18;
    void v27[2] = v20;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    uint64_t v23 = [v21 andPredicateWithSubpredicates:v22];

    unint64_t v12 = 0x1E4F28000uLL;
    [v11 addObject:v23];
  }
  long long v24 = [*(id *)(v12 + 2976) orPredicateWithSubpredicates:v11];

  return v24;
}

+ (id)predicateForSpotlightEventsWithBundleID:(void *)a3 sinceDate:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v5);

  uint64_t v7 = +[_DKQuery predicateForEventsWithStartDateAfter:v4];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v7;
  v12[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (void)predicateForObjectsWithMetadataKey:(uint64_t)a3 andValue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end