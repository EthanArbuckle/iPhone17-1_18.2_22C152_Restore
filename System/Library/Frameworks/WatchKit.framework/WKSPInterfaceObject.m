@interface WKSPInterfaceObject
- (NSString)interfaceProperty;
- (NSString)propertyIndex;
- (NSString)viewControllerID;
- (WKSPInterfaceObject)init;
- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7;
- (int64_t)rowIndex;
- (int64_t)tableIndex;
- (void)_sendValueChanged:(id)a3;
- (void)_sendValueChanged:(id)a3 forProperty:(id)a4;
- (void)setInterfaceProperty:(id)a3;
- (void)setPropertyIndex:(id)a3;
- (void)setRowIndex:(int64_t)a3;
- (void)setTableIndex:(int64_t)a3;
- (void)setViewControllerID:(id)a3;
@end

@implementation WKSPInterfaceObject

- (WKSPInterfaceObject)init
{
  return 0;
}

- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7
{
  int v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WKSPInterfaceObject;
  id v11 = a4;
  id v12 = a3;
  v13 = [(WKSPInterfaceObject *)&v16 init];
  [(WKSPInterfaceObject *)v13 setInterfaceProperty:v12];

  [(WKSPInterfaceObject *)v13 setViewControllerID:v11];
  v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", (v9 + 1));
  [(WKSPInterfaceObject *)v13 setPropertyIndex:v14];

  [(WKSPInterfaceObject *)v13 setTableIndex:a6];
  [(WKSPInterfaceObject *)v13 setRowIndex:a7];
  return v13;
}

- (void)_sendValueChanged:(id)a3
{
}

- (void)_sendValueChanged:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v15 = [(WKSPInterfaceObject *)self propertyIndex];
  if ([(WKSPInterfaceObject *)self tableIndex] >= 1
    && [(WKSPInterfaceObject *)self tableIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKSPInterfaceObject tableIndex](self, "tableIndex"));
    int v9 = [v8 stringValue];
    uint64_t v10 = [v15 stringByAppendingPathComponent:v9];

    id v15 = (id)v10;
  }
  if ([(WKSPInterfaceObject *)self rowIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[WKSPInterfaceObject rowIndex](self, "rowIndex"));
    id v12 = [v11 stringValue];
    uint64_t v13 = [v15 stringByAppendingPathComponent:v12];

    id v15 = (id)v13;
  }
  v14 = [(WKSPInterfaceObject *)self viewControllerID];
  +[SPRemoteInterface setController:v14 key:v15 property:v6 value:v7];
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

@end