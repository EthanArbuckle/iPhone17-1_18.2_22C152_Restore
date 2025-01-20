@interface SRFaceMetrics
- (id)sr_dictionaryRepresentation;
@end

@implementation SRFaceMetrics

- (id)sr_dictionaryRepresentation
{
  v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)[(SRFaceMetrics *)self wholeFaceExpressions] count]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(SRFaceMetrics *)self wholeFaceExpressions];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableArray addObject:](v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v8), "sr_dictionaryRepresentation"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v6);
  }
  v9 = +[NSMutableArray arrayWithCapacity:[(NSArray *)[(SRFaceMetrics *)self partialFaceExpressions] count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [(SRFaceMetrics *)self partialFaceExpressions];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NSMutableArray addObject:](v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "sr_dictionaryRepresentation"));
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v12);
  }
  v24[0] = @"version";
  v25[0] = [(SRFaceMetrics *)self version];
  v24[1] = @"sessionIdentifier";
  v25[1] = [(SRFaceMetrics *)self sessionIdentifier];
  v24[2] = @"context";
  v25[2] = +[NSNumber numberWithUnsignedInteger:[(SRFaceMetrics *)self context]];
  v24[3] = @"faceAnchor";
  v25[3] = [(ARFaceAnchor *)[(SRFaceMetrics *)self faceAnchor] sr_dictionaryRepresentation];
  v25[4] = v3;
  v24[4] = @"wholeFaceExpressions";
  v24[5] = @"partialFaceExpressions";
  v25[5] = v9;
  return +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];
}

@end