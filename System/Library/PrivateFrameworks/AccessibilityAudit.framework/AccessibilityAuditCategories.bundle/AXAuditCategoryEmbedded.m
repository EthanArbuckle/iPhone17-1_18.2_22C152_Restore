@interface AXAuditCategoryEmbedded
+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4;
+ (int)axInterfaceOrientationForDeviceOrientation:(int64_t)a3;
+ (int64_t)axDeviceOrientationForInterfaceOrientation:(int)a3;
- ($5A02F7D70E7A678ABCAACDC101C00631)windowContextInformation;
- (CGRect)frameForElement:(id)a3;
- (CGRect)orientedFrameForElement:(id)a3;
- (CGRect)orientedFrameForRect:(CGRect)a3;
- (CGRect)orientedScreenBounds;
- (id)_topLevelAppElement;
- (id)elementDescriptionForElement:(id)a3;
- (id)iOSFrontmostAppForTargetPid;
- (int)interfaceOrientation;
- (void)testOnAllVisibleElements:(id)a3;
@end

@implementation AXAuditCategoryEmbedded

- (void)testOnAllVisibleElements:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "visibleElements", 0);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)iOSFrontmostAppForTargetPid
{
  if ([(AXAuditCategoryEmbedded *)self targetPid])
  {
    AXAuditCurrentApplications();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        int v9 = AXAuditPidForElement();
        if ([(AXAuditCategoryEmbedded *)self targetPid] == v9) {
          break;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v10 = v8;

      if (v10) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
  }
  iOSFrontmostApp();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

- (CGRect)frameForElement:(id)a3
{
  [a3 frame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)orientedFrameForElement:(id)a3
{
  [a3 frame];

  -[AXAuditCategoryEmbedded orientedFrameForRect:](self, "orientedFrameForRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)orientedFrameForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = objc_msgSend((id)objc_opt_class(), "axDeviceOrientationForInterfaceOrientation:", -[AXAuditCategoryEmbedded interfaceOrientation](self, "interfaceOrientation"));
  v8.n128_f64[0] = x;
  v9.n128_f64[0] = y;
  v10.n128_f64[0] = width;
  v11.n128_f64[0] = height;

  _AX_CGRectToOrientation(v7, v8, v9, v10, v11);
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)elementDescriptionForElement:(id)a3
{
  double v3 = (const __AXUIElement *)[a3 elementRef];
  pid_t pid = 0;
  if (AXUIElementGetPid(v3, &pid) || !AuditDoesAllowDeveloperAttributes(pid)) {
    goto LABEL_7;
  }
  CFTypeRef cf = 0;
  AXError v4 = AXUIElementCopyAttributeValue(v3, (CFStringRef)&unk_13B5, &cf);
  double v5 = 0;
  if (v4 == kAXErrorSuccess)
  {
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      CFTypeID TypeID = CFStringGetTypeID();
      double v5 = (void *)cf;
      if (v6 != TypeID)
      {
        CFRelease(cf);
LABEL_7:
        double v5 = 0;
      }
    }
  }

  return v5;
}

- (id)_topLevelAppElement
{
  v2 = [(AXAuditCategoryEmbedded *)self iOSFrontmostAppForTargetPid];
  double v3 = [v2 uiElement];

  return v3;
}

- (int)interfaceOrientation
{
  v2 = [(AXAuditCategoryEmbedded *)self _topLevelAppElement];
  double v3 = [v2 uiElementsWithAttribute:2017];
  AXError v4 = [v3 lastObject];

  double v5 = [v4 numberWithAXAttribute:3035];
  int v6 = [v5 unsignedIntegerValue];

  if (!v6)
  {
    id v7 = +[AXUIElement uiSystemWideApplication];
    __n128 v8 = [v7 uiElementsWithAttribute:1001];
    __n128 v9 = [v8 lastObject];

    __n128 v10 = [v9 numberWithAXAttribute:1503];
    unsigned int v11 = [v10 intValue];

    if (v11 <= 1) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    int v6 = [(id)objc_opt_class() axInterfaceOrientationForDeviceOrientation:v12];
  }
  return v6;
}

+ (int64_t)axDeviceOrientationForInterfaceOrientation:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 4) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)axInterfaceOrientationForDeviceOrientation:(int64_t)a3
{
  return 0;
}

- (CGRect)orientedScreenBounds
{
  AXDeviceGetMainScreenBounds();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(AXAuditCategoryEmbedded *)self interfaceOrientation] - 3 <= 1)
  {
    AXDeviceGetMainScreenBounds();
    double v8 = v11;
    AXDeviceGetMainScreenBounds();
    double v10 = v12;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- ($5A02F7D70E7A678ABCAACDC101C00631)windowContextInformation
{
  v37 = [(AXAuditCategoryEmbedded *)self _topLevelAppElement];
  double v3 = [v37 arrayWithAXAttribute:3052];
  v39 = +[NSMutableArray array];
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v8)
  {
    id v9 = v8;
    CFStringRef v10 = @"contextId";
    uint64_t v11 = *(void *)v45;
    double v12 = &AXAuditCurrentApplications_ptr;
    do
    {
      double v13 = 0;
      id v40 = v9;
      do
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v13);
        double v15 = [v14 objectForKeyedSubscript:v10];
        double v16 = [v14 objectForKeyedSubscript:@"isKeyboardWindow"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [v14 objectForKeyedSubscript:@"isKeyboardWindow"];
          unsigned int v18 = [v17 BOOLValue];
        }
        else
        {
          unsigned int v18 = 0;
        }

        v19 = [v14 objectForKeyedSubscript:@"isMainWindow"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = v12;
          uint64_t v21 = v11;
          CFStringRef v22 = v10;
          v23 = [v14 objectForKeyedSubscript:@"isKeyboardWindow"];
          unsigned int v24 = [v23 BOOLValue] ^ 1;

          if ((v18 | v24))
          {
            CFStringRef v10 = v22;
            uint64_t v11 = v21;
          }
          else
          {
            v25 = [v14 objectForKeyedSubscript:@"frame"];

            long long valuePtr = 0u;
            long long v43 = 0u;
            AXValueGetValue((AXValueRef)v25, kAXValueTypeCGRect, &valuePtr);
            if (v15) {
              [v39 addObject:v15];
            }
            v26 = objc_opt_class();
            id v27 = [v15 unsignedIntValue];
            objc_msgSend(v26, "_appRelativeRectForRect:contextId:", v27, valuePtr, v43);
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            v49.origin.CGFloat x = x;
            v49.origin.CGFloat y = y;
            v49.size.CGFloat width = width;
            v49.size.CGFloat height = height;
            CFStringRef v10 = v22;
            if (!CGRectIsEmpty(v49))
            {
              v50.origin.CGFloat x = x;
              v50.origin.CGFloat y = y;
              v50.size.CGFloat width = width;
              v50.size.CGFloat height = height;
              v52.origin.CGFloat x = v29;
              v52.origin.CGFloat y = v31;
              v52.size.CGFloat width = v33;
              v52.size.CGFloat height = v35;
              CGRect v51 = CGRectUnion(v50, v52);
              CGFloat v29 = v51.origin.x;
              CGFloat v31 = v51.origin.y;
              CGFloat v33 = v51.size.width;
              CGFloat v35 = v51.size.height;
            }
            uint64_t v11 = v21;
            CGFloat height = v35;
            CGFloat width = v33;
            CGFloat y = v31;
            CGFloat x = v29;
          }
          double v12 = v20;
          id v9 = v40;
        }
        else
        {
        }
        double v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      id v9 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v9);
  }

  retstr->var0 = v39;
  retstr->var1.origin.CGFloat x = x;
  retstr->var1.origin.CGFloat y = y;
  retstr->var1.size.CGFloat width = width;
  retstr->var1.size.CGFloat height = height;

  return result;
}

+ (CGRect)_appRelativeRectForRect:(CGRect)a3 contextId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  CGRect valuePtr = a3;
  AXValueRef v5 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
  double v6 = +[AXUIElement uiSystemWideApplication];
  double v7 = +[NSNumber numberWithUnsignedInt:v4];
  id v8 = (const __AXValue *)objc_msgSend(v6, "objectWithAXAttribute:parameter:", 91505, +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v7, 0));

  if (v5) {
    CFRelease(v5);
  }
  if (v8) {
    AXValueGetValue(v8, kAXValueTypeCGRect, &valuePtr);
  }
  double width = valuePtr.size.width;
  double height = valuePtr.size.height;
  double x = valuePtr.origin.x;
  double y = valuePtr.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end