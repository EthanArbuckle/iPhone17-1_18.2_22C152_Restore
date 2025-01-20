@interface DebugHierarchyRequest
- (id)lldbExpressionInPlaceOutError:(id *)a3;
- (id)lldbExpressionReturningNSDataOutError:(id *)a3;
@end

@implementation DebugHierarchyRequest

- (id)lldbExpressionReturningNSDataOutError:(id *)a3
{
  v5 = [(DebugHierarchyRequest *)self serializedCompatibilitySupportRepresentation];

  if (v5)
  {
    v6 = [(DebugHierarchyRequest *)self serializedCompatibilitySupportRepresentation];
LABEL_3:
    v7 = [v6 base64EncodedStringWithOptions:0];
    v8 = +[NSString stringWithFormat:@"(id)[[(Class)objc_getClass(\"DBGTargetHub\") sharedHub] performRequestWithRequestInBase64:@\"%@\"]", v7];

    id v9 = 0;
    goto LABEL_4;
  }
  v11 = [(DebugHierarchyRequest *)self dictionaryRepresentation];
  id v12 = 0;
  v6 = [v11 generateJSONDataWithError:&v12];
  id v9 = v12;

  if (!v9) {
    goto LABEL_3;
  }
  if (a3)
  {
    id v9 = v9;
    v8 = 0;
    *a3 = v9;
  }
  else
  {
    v8 = 0;
  }
LABEL_4:

  return v8;
}

- (id)lldbExpressionInPlaceOutError:(id *)a3
{
  v5 = [(DebugHierarchyRequest *)self serializedCompatibilitySupportRepresentation];

  if (v5)
  {
    v6 = [(DebugHierarchyRequest *)self serializedCompatibilitySupportRepresentation];
LABEL_3:
    v7 = [v6 base64EncodedStringWithOptions:0];
    v8 = +[NSString stringWithFormat:@"(BOOL)[[(Class)objc_getClass(\"DebugHierarchyTargetHub\") sharedHub] performRequestInPlaceWithRequestInBase64:@\"%@\"]", v7];

    id v9 = 0;
    goto LABEL_4;
  }
  v11 = [(DebugHierarchyRequest *)self dictionaryRepresentation];
  id v12 = 0;
  v6 = [v11 generateJSONDataWithError:&v12];
  id v9 = v12;

  if (!v9) {
    goto LABEL_3;
  }
  if (a3)
  {
    id v9 = v9;
    v8 = 0;
    *a3 = v9;
  }
  else
  {
    v8 = 0;
  }
LABEL_4:

  return v8;
}

@end