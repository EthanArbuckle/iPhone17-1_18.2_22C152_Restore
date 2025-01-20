@interface CTNetworkSelectionInfo
+ (BOOL)supportsSecureCoding;
- (CTNetwork)selection;
- (CTNetworkSelectionInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)selectionMode;
- (unint64_t)selectionState;
- (void)encodeWithCoder:(id)a3;
- (void)setSelection:(id)a3;
- (void)setSelectionMode:(unint64_t)a3;
- (void)setSelectionState:(unint64_t)a3;
@end

@implementation CTNetworkSelectionInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTNetworkSelectionInfo *)self selectionState];
  if (v4 - 1 > 5) {
    v5 = "CTNetworkSelectionStateUnknown";
  }
  else {
    v5 = off_1E5263FA8[v4 - 1];
  }
  [v3 appendFormat:@", selectionState=%s", v5];
  unint64_t v6 = [(CTNetworkSelectionInfo *)self selectionMode];
  v7 = "CTNetworkSelectionModeDisabled";
  if (v6 == 2) {
    v7 = "CTNetworkSelectionModeManual";
  }
  if (v6 == 1) {
    v7 = "CTNetworkSelectionModeAutomatic";
  }
  [v3 appendFormat:@", selectionMode=%s", v7];
  v8 = [(CTNetworkSelectionInfo *)self selection];
  [v3 appendFormat:@", selection=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSelectionState:", -[CTNetworkSelectionInfo selectionState](self, "selectionState"));
  objc_msgSend(v4, "setSelectionMode:", -[CTNetworkSelectionInfo selectionMode](self, "selectionMode"));
  v5 = [(CTNetworkSelectionInfo *)self selection];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setSelection:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = NSNumber;
  id v5 = a3;
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[CTNetworkSelectionInfo selectionMode](self, "selectionMode"));
  [v5 encodeObject:v6 forKey:@"selection_mode"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTNetworkSelectionInfo selectionState](self, "selectionState"));
  [v5 encodeObject:v7 forKey:@"selection_state"];

  id v8 = [(CTNetworkSelectionInfo *)self selection];
  [v5 encodeObject:v8 forKey:@"selection"];
}

- (CTNetworkSelectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTNetworkSelectionInfo;
  id v5 = [(CTNetworkSelectionInfo *)&v11 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection_mode"];
    v5->_selectionMode = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection_state"];
    v5->_selectionState = [v7 unsignedIntegerValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection"];
    selection = v5->_selection;
    v5->_selection = (CTNetwork *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (void)setSelectionState:(unint64_t)a3
{
  self->_selectionState = a3;
}

- (unint64_t)selectionMode
{
  return self->_selectionMode;
}

- (void)setSelectionMode:(unint64_t)a3
{
  self->_selectionMode = a3;
}

- (CTNetwork)selection
{
  return self->_selection;
}

- (void)setSelection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end