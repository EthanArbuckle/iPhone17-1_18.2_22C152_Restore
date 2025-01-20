@interface WKInterfaceObject
- (NSString)interfaceProperty;
- (NSString)propertyIndex;
- (NSString)viewControllerID;
- (WKInterfaceObject)init;
- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7;
- (int64_t)rowIndex;
- (int64_t)tableIndex;
- (void)_sendValueChanged:(id)a3;
- (void)_sendValueChanged:(id)a3 forProperty:(id)a4;
- (void)_setImage:(id)a3 forProperty:(id)a4;
- (void)_setImageData:(id)a3 forProperty:(id)a4;
- (void)_setImageNamed:(id)a3 forProperty:(id)a4;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityImageRegions:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setHeight:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setInterfaceProperty:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)setPropertyIndex:(id)a3;
- (void)setRelativeHeight:(double)a3 withAdjustment:(double)a4;
- (void)setRelativeWidth:(double)a3 withAdjustment:(double)a4;
- (void)setRotation:(double)a3;
- (void)setRowIndex:(int64_t)a3;
- (void)setTableIndex:(int64_t)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setViewControllerID:(id)a3;
- (void)setWidth:(double)a3;
- (void)sizeToFitHeight;
- (void)sizeToFitWidth;
@end

@implementation WKInterfaceObject

- (WKInterfaceObject)init
{
  return 0;
}

- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7
{
  int v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WKInterfaceObject;
  id v11 = a4;
  id v12 = a3;
  v13 = [(WKInterfaceObject *)&v16 init];
  [(WKInterfaceObject *)v13 setInterfaceProperty:v12];

  [(WKInterfaceObject *)v13 setViewControllerID:v11];
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v9 + 1));
  [(WKInterfaceObject *)v13 setPropertyIndex:v14];

  [(WKInterfaceObject *)v13 setRowIndex:a7];
  [(WKInterfaceObject *)v13 setTableIndex:a6];
  return v13;
}

- (void)_setImage:(id)a3 forProperty:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = +[SPRemoteInterface SerializablePropertyValue:a3];
  if (v7)
  {
    v8 = +[SPCompanionAssetCache sharedInstance];
    int v9 = [v8 keyFromImageData:v7];

    v10 = +[SPCompanionAssetCache sharedInstance];
    int v11 = [v10 imageInTransientCache:v9];

    if (v11)
    {
      [(WKInterfaceObject *)self _sendValueChanged:v9 forProperty:v6];
    }
    else
    {
      v14[0] = @"a";
      v14[1] = @"d";
      v15[0] = v9;
      v15[1] = v7;
      v14[2] = @"t";
      v15[2] = &unk_26D31C2A0;
      id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
      [(WKInterfaceObject *)self _sendValueChanged:v12 forProperty:v6];
      v13 = +[SPCompanionAssetCache sharedInstance];
      [v13 addImageReferenceToTransientCache:v7 withName:v9];
    }
  }
}

- (void)_setImageData:(id)a3 forProperty:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = +[SPCompanionAssetCache sharedInstance];
    int v9 = [v8 keyFromImageData:v6];

    v10 = +[SPCompanionAssetCache sharedInstance];
    int v11 = [v10 imageInTransientCache:v9];

    if (v11)
    {
      [(WKInterfaceObject *)self _sendValueChanged:v9 forProperty:v7];
    }
    else
    {
      v14[0] = @"a";
      v14[1] = @"d";
      v15[0] = v9;
      v15[1] = v6;
      v14[2] = @"t";
      v15[2] = &unk_26D31C2A0;
      id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
      [(WKInterfaceObject *)self _sendValueChanged:v12 forProperty:v7];
      v13 = +[SPCompanionAssetCache sharedInstance];
      [v13 addImageReferenceToTransientCache:v6 withName:v9];
    }
  }
}

- (void)_setImageNamed:(id)a3 forProperty:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[SPCompanionAssetCache sharedInstance];
  int v9 = [v8 dataForImageWithName:v6];

  if (v9)
  {
    v11[0] = @"a";
    v11[1] = @"d";
    v12[0] = v6;
    v12[1] = v9;
    v11[2] = @"t";
    v12[2] = &unk_26D31C2B8;
    v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    [(WKInterfaceObject *)self _sendValueChanged:v10 forProperty:v7];
  }
  else
  {
    [(WKInterfaceObject *)self _sendValueChanged:v6 forProperty:v7];
  }
}

- (void)_sendValueChanged:(id)a3
{
}

- (void)_sendValueChanged:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = [(WKInterfaceObject *)self propertyIndex];
  if ([(WKInterfaceObject *)self tableIndex] >= 1
    && [(WKInterfaceObject *)self tableIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKInterfaceObject tableIndex](self, "tableIndex"));
    int v9 = [v8 stringValue];
    uint64_t v10 = [v15 stringByAppendingPathComponent:v9];

    id v15 = (id)v10;
  }
  if ([(WKInterfaceObject *)self rowIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKInterfaceObject rowIndex](self, "rowIndex"));
    id v12 = [v11 stringValue];
    uint64_t v13 = [v15 stringByAppendingPathComponent:v12];

    id v15 = (id)v13;
  }
  v14 = [(WKInterfaceObject *)self viewControllerID];
  +[SPRemoteInterface setController:v14 key:v15 property:v6 value:v7];
}

- (void)setHidden:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"hn"];
}

- (void)setAlpha:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"ap"];
}

- (void)setWidth:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"wd"];
}

- (void)setHeight:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"ht"];
}

- (void)setRelativeWidth:(double)a3 withAdjustment:(double)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  id v6 = [NSNumber numberWithDouble:a3];
  v9[0] = v6;
  id v7 = [NSNumber numberWithDouble:a4];
  v9[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [(WKInterfaceObject *)self _sendValueChanged:v8 forProperty:@"rw"];
}

- (void)setRelativeHeight:(double)a3 withAdjustment:(double)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  id v6 = [NSNumber numberWithDouble:a3];
  v9[0] = v6;
  id v7 = [NSNumber numberWithDouble:a4];
  v9[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [(WKInterfaceObject *)self _sendValueChanged:v8 forProperty:@"rh"];
}

- (void)sizeToFitWidth
{
}

- (void)sizeToFitHeight
{
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"ha"];
}

- (void)setVerticalAlignment:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"va"];
}

- (void)setRotation:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"ro"];
}

- (NSString)interfaceProperty
{
  return self->_interfaceProperty;
}

- (void)setInterfaceProperty:(id)a3
{
}

- (NSString)viewControllerID
{
  return self->_viewControllerID;
}

- (void)setViewControllerID:(id)a3
{
}

- (NSString)propertyIndex
{
  return self->_propertyIndex;
}

- (void)setPropertyIndex:(id)a3
{
}

- (int64_t)tableIndex
{
  return self->_tableIndex;
}

- (void)setTableIndex:(int64_t)a3
{
  self->_tableIndex = a3;
}

- (int64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(int64_t)a3
{
  self->_rowIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyIndex, 0);
  objc_storeStrong((id *)&self->_viewControllerID, 0);

  objc_storeStrong((id *)&self->_interfaceProperty, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"Ai"];
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"Al"];
}

- (void)setAccessibilityHint:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"Ah"];
}

- (void)setAccessibilityValue:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"Av"];
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"Ae"];
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"At"];
}

- (void)setAccessibilityImageRegions:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "label", (void)v25);

        if (v12)
        {
          [v11 frame];
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          v19 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v5 addObject:v19];

          v20 = [NSNumber numberWithDouble:v14];
          [v5 addObject:v20];

          v21 = [NSNumber numberWithDouble:v16];
          [v5 addObject:v21];

          v22 = [NSNumber numberWithDouble:v18];
          [v5 addObject:v22];

          v23 = [v11 label];
          v24 = (void *)[v23 copy];
          [v5 addObject:v24];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  [(WKInterfaceObject *)self _sendValueChanged:v5 forProperty:@"Ar"];
}

@end