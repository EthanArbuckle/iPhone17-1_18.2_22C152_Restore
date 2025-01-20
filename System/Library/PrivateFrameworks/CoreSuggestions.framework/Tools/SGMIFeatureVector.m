@interface SGMIFeatureVector
- (id)initWithDictionary:(id)a3 simpleMailMessage:(id)a4 messageId:(id)a5 hasHashedMessageId:(BOOL)a6 store:(id)a7;
@end

@implementation SGMIFeatureVector

- (id)initWithDictionary:(id)a3 simpleMailMessage:(id)a4 messageId:(id)a5 hasHashedMessageId:(BOOL)a6 store:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v27 = v13;
  v16 = [(SGMIFeatureVector *)self initWithMessageId:v14 hasHashedMessageId:v8 simpleMailMessage:v13 senderConnectionScore:kDefaultUnknownConnectionScore biomeMessageSummary:0 store:v15 preLoadedFeatureNames:&__NSArray0__struct];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v23 = (int)[v22 intValue];
        switch((unint64_t)+[SGMIFeature featureTypeForName:v23])
        {
          case 0uLL:
            id v26 = [objc_alloc((Class)NSString) initWithFormat:@"Error: No real feature can be of type SGMIFeatureType_None."];
            puts((const char *)[v26 UTF8String]);

            exit(1);
          case 1uLL:
            v24 = [v17 objectForKeyedSubscript:v22];
            [(SGMIFeatureVector *)v16 setFeatureToNumberValue:v24 forName:v23];
            goto LABEL_11;
          case 2uLL:
            v24 = [v17 objectForKeyedSubscript:v22];
            [(SGMIFeatureVector *)v16 setFeatureToNumberArrayValue:v24 forName:v23];
            goto LABEL_11;
          case 3uLL:
            v24 = [v17 objectForKeyedSubscript:v22];
            [(SGMIFeatureVector *)v16 setFeatureToStringValue:v24 forName:v23];
            goto LABEL_11;
          case 4uLL:
            v24 = [v17 objectForKeyedSubscript:v22];
            [(SGMIFeatureVector *)v16 setFeatureToStringArrayValue:v24 forName:v23];
LABEL_11:

            break;
          default:
            continue;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  return v16;
}

@end