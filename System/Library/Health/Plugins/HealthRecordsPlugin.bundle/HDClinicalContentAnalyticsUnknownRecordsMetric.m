@interface HDClinicalContentAnalyticsUnknownRecordsMetric
- (HDClinicalContentAnalyticsUnknownRecordsMetric)init;
- (NSString)debugDescription;
- (id)analyticsString;
- (id)elements;
- (int64_t)countForMetricElement:(id)a3;
- (unint64_t)count;
- (void)_addMetricElementsForRulesVersion:(int64_t)a3 hostURL:(id)a4 resourceType:(id)a5 failureInfo:(id)a6;
- (void)accumulateMetricForItem:(id)a3;
- (void)addUnknownRecordsMetricElement:(id)a3;
- (void)enumerateElementsAsCoreAnalyticsPayloadWithDeviceContext:(id)a3 block:(id)a4;
- (void)resetMetric;
@end

@implementation HDClinicalContentAnalyticsUnknownRecordsMetric

- (HDClinicalContentAnalyticsUnknownRecordsMetric)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalContentAnalyticsUnknownRecordsMetric;
  v2 = [(HDClinicalContentAnalyticsUnknownRecordsMetric *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    elements = v2->_elements;
    v2->_elements = v3;
  }
  return v2;
}

- (void)accumulateMetricForItem:(id)a3
{
  id v5 = a3;
  objc_super v6 = [v5 medicalRecord];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDClinicalContentAnalyticsUnknownRecordsMetric.m", 44, @"Invalid parameter not satisfying: %@", @"[item.medicalRecord isKindOfClass:[HKUnknownRecord class]]" object file lineNumber description];
  }
  id v18 = [v5 medicalRecord];
  v8 = [v18 metadata];
  v9 = [v8 objectForKeyedSubscript:_HKPrivateMetadataKeyExtractionFailureInfo];

  id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:0];
  id v11 = [objc_alloc((Class)HDHRSExtractionFailureInfo) initWithCoder:v10];
  v12 = [v5 medicalRecord];
  id v13 = [v12 extractionVersion];

  v14 = [v5 sourceURL];

  v15 = [v18 FHIRIdentifier];
  v16 = [v15 resourceType];
  [(HDClinicalContentAnalyticsUnknownRecordsMetric *)self _addMetricElementsForRulesVersion:v13 hostURL:v14 resourceType:v16 failureInfo:v11];
}

- (void)_addMetricElementsForRulesVersion:(int64_t)a3 hostURL:(id)a4 resourceType:(id)a5 failureInfo:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [a4 absoluteString];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v21 = v11;
  id obj = [v11 failureRecords];
  id v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v18 = [v17 resourceKeyPath];
        v19 = [v17 propertyName];
        v20 = -[HDClinicalContentAnalyticsUnknownRecordsMetricElement initWithExtractionRulesVersion:reportedHost:resourceType:propertyName:resourceKeyPath:failureCode:]([HDClinicalContentAnalyticsUnknownRecordsMetricElement alloc], "initWithExtractionRulesVersion:reportedHost:resourceType:propertyName:resourceKeyPath:failureCode:", a3, v12, v10, v19, v18, [v17 failureCode]);
        [(HDClinicalContentAnalyticsUnknownRecordsMetric *)self addUnknownRecordsMetricElement:v20];
      }
      id v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_elements count];
}

- (void)enumerateElementsAsCoreAnalyticsPayloadWithDeviceContext:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  elements = self->_elements;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_75E98;
  v11[3] = &unk_1142A8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSMutableDictionary *)elements enumerateKeysAndObjectsUsingBlock:v11];
}

- (void)addUnknownRecordsMetricElement:(id)a3
{
  elements = self->_elements;
  id v5 = a3;
  id v7 = [(NSMutableDictionary *)elements objectForKeyedSubscript:v5];
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v7 integerValue] + 1);
  [(NSMutableDictionary *)self->_elements setObject:v6 forKeyedSubscript:v5];
}

- (int64_t)countForMetricElement:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)resetMetric
{
}

- (id)elements
{
  id v2 = [(NSMutableDictionary *)self->_elements copy];

  return v2;
}

- (NSString)debugDescription
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_elements, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_elements;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int64_t v10 = [(HDClinicalContentAnalyticsUnknownRecordsMetric *)self countForMetricElement:v9];
        id v11 = [v9 debugDescription];
        id v12 = +[NSString stringWithFormat:@"%@ --> %lu", v11, v10];

        [v3 addObject:v12];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v13 = objc_opt_class();
  unint64_t v14 = [(HDClinicalContentAnalyticsUnknownRecordsMetric *)self count];
  uint64_t v15 = [v3 componentsJoinedByString:@"\n\t"];
  v16 = +[NSString stringWithFormat:@"<%@ %p> %lu elements:\n\t%@", v13, self, v14, v15, (void)v18];

  return (NSString *)v16;
}

- (id)analyticsString
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_elements, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSMutableDictionary *)self->_elements hk_sortedKeys];
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int64_t v10 = +[NSNumber numberWithInteger:[(HDClinicalContentAnalyticsUnknownRecordsMetric *)self countForMetricElement:v9]];
        id v11 = [v9 payloadForCoreAnalyticsWithEventCount:v10 deviceContext:&__NSDictionary0__struct];

        id v12 = [v11 description];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v13 = objc_opt_class();
  unint64_t v14 = [(HDClinicalContentAnalyticsUnknownRecordsMetric *)self count];
  uint64_t v15 = [v3 componentsJoinedByString:@"\n---\n"];
  v16 = +[NSString stringWithFormat:@"%@ %lu elements:\n\n%@", v13, v14, v15];

  return v16;
}

- (void).cxx_destruct
{
}

@end