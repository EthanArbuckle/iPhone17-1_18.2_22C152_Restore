@interface CRSDashboardFocusableItem
+ (BOOL)supportsSecureCoding;
- (CGRect)frameInWindow;
- (CRSDashboardFocusableItem)init;
- (CRSDashboardFocusableItem)initWithCoder:(id)a3;
- (CRSDashboardFocusableItem)initWithFocusableView:(id)a3;
- (CRSUIDashboardFocusableItemProviding)focusProvidingItem;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setFocusProvidingItem:(id)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CRSDashboardFocusableItem

- (CRSDashboardFocusableItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRSDashboardFocusableItem;
  v2 = [(CRSDashboardFocusableItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSDashboardFocusableItem)initWithFocusableView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRSDashboardFocusableItem;
  v5 = [(CRSDashboardFocusableItem *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusProvidingItem, v4);
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;
  }
  return v6;
}

- (CRSDashboardFocusableItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSDashboardFocusableItem;
  v5 = [(CRSDashboardFocusableItem *)&v9 init];
  if (v5)
  {
    [v4 decodeCGRectForKey:@"frameInWindow"];
    -[CRSDashboardFocusableItem setFrameInWindow:](v5, "setFrameInWindow:");
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"focusableIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CRSDashboardFocusableItem *)self identifier];
  [v5 encodeObject:v4 forKey:@"focusableIdentifier"];

  [(CRSDashboardFocusableItem *)self frameInWindow];
  objc_msgSend(v5, "encodeCGRect:forKey:", @"frameInWindow");
}

- (CGRect)frameInWindow
{
  double x = self->_frameInWindow.origin.x;
  double y = self->_frameInWindow.origin.y;
  double width = self->_frameInWindow.size.width;
  double height = self->_frameInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CRSUIDashboardFocusableItemProviding)focusProvidingItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusProvidingItem);
  return (CRSUIDashboardFocusableItemProviding *)WeakRetained;
}

- (void)setFocusProvidingItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusProvidingItem);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end