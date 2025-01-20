@interface _FEFocusUpdateReportFormatter
- (id)_bodyForReport:(id)a3;
- (id)_componentsFromReport:(id)a3;
- (id)_headerForReport:(id)a3;
- (id)stringFromReport:(id)a3;
@end

@implementation _FEFocusUpdateReportFormatter

- (id)_componentsFromReport:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEFocusUpdateReport.m", 67, @"Invalid parameter not satisfying: %@", @"report" object file lineNumber description];
  }
  v6 = objc_alloc_init(_FEDebugReportComponents);
  v7 = [(_FEFocusUpdateReportFormatter *)self _headerForReport:v5];
  [(_FEDebugReportComponents *)v6 setHeader:v7];

  v8 = [(_FEFocusUpdateReportFormatter *)self _bodyForReport:v5];
  [(_FEDebugReportComponents *)v6 setBody:v8];

  return v6;
}

- (id)stringFromReport:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_FEFocusUpdateReport.m", 78, @"Invalid parameter not satisfying: %@", @"report" object file lineNumber description];
  }
  v6 = [(_FEFocusUpdateReportFormatter *)self _componentsFromReport:v5];
  v7 = [(_FEDebugReportFormatter *)self stringFromReportComponents:v6];

  return v7;
}

- (id)_headerForReport:(id)a3
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = a3;
  id v5 = [v3 string];
  v6 = [v4 focusSystem];
  v7 = [v4 context];

  v8 = [v7 _focusMovement];

  int v9 = [v7 _isValidInFocusSystem:v6];
  v10 = @"Moving focus";
  if (!v8) {
    v10 = @"Updating focus";
  }
  v11 = @"Focus failed to update";
  if (v8) {
    v11 = @"Focus failed to move";
  }
  if (v9) {
    v12 = v10;
  }
  else {
    v12 = v11;
  }
  [v5 appendString:v12];
  v13 = [v7 previouslyFocusedItem];
  if (v13)
  {
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v13];

    [v5 appendFormat:@" from %@", v17];
  }
  else if (v8)
  {
    [v5 appendString:@" from offscreen"];
  }
  v18 = [v7 nextFocusedItem];
  if (v18)
  {
    v19 = NSString;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = [v19 stringWithFormat:@"<%@: %p>", v21, v18];

    [v5 appendFormat:@" to %@", v22];
  }
  if (v6)
  {
    v23 = NSString;
    id v24 = v6;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [v23 stringWithFormat:@"<%@: %p>", v26, v24];

    [v5 appendFormat:@" in focus system %@", v27];
  }
  [v5 appendString:@"."];

  return v5;
}

- (id)_bodyForReport:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 1;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __48___FEFocusUpdateReportFormatter__bodyForReport___block_invoke;
  v22[3] = &unk_2653285F8;
  id v5 = v4;
  id v23 = v5;
  id v24 = v25;
  v6 = (void (**)(void))MEMORY[0x25335DA10](v22);
  v7 = [v3 focusSystem];
  v8 = [v3 context];
  int v9 = [v8 _validationReport];
  char v10 = [v8 _isValidInFocusSystem:v7];
  if (v9) {
    char v11 = v10;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    v12 = [v9 issues];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = +[_FEDebugReportFormatter defaultFormatter];
      [v14 setHeader:@"The following issues were found that prevented this update from occurring:"];
      v6[2](v6);
      v15 = [v14 stringFromReport:v9];
      [v5 appendString:v15];
    }
  }
  v16 = [v8 _preferredFocusReport];
  v17 = v16;
  if (v16 && [v16 messageCount])
  {
    v18 = +[_FEDebugReportFormatter defaultFormatter];
    [v18 setIndentLevel:1];
    [v18 setIndentString:@"|\t"];
    v6[2](v6);
    v19 = [v18 stringFromReport:v17];
    [v5 appendFormat:@"The result of the focus update was determined from the following preferred focus search:\n|\n%@\n|", v19];
  }
  id v20 = v5;

  _Block_object_dispose(v25, 8);
  return v20;
}

@end