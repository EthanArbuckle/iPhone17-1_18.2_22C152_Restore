@interface AVLayoutItemAttributes
- (AVLayoutItemAttributes)displayPartnerAttributes;
- (AVLayoutItemAttributes)init;
- (AVLayoutItemAttributes)nextAttributesInLayoutOrder;
- (AVLayoutItemAttributes)nextAttributesInPriorityOrder;
- (BOOL)canOnlyAppearInControlOverflowMenu;
- (BOOL)canOverflowToAuxiliaryMenu;
- (BOOL)canSubstituteOtherAttributes;
- (BOOL)hasFlexibleContentSize;
- (BOOL)isCollapsed;
- (BOOL)isCollapsedOrExcluded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncluded;
- (BOOL)prefersSecondaryMaterialOverlay;
- (CGSize)minimumSize;
- (NSString)accessibilityIdentifier;
- (NSString)uniqueIdentifier;
- (double)trailingInterItemSpace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)displayPriority;
- (unint64_t)hash;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setCanOnlyAppearInControlOverflowMenu:(BOOL)a3;
- (void)setCanOverflowToAuxiliaryMenu:(BOOL)a3;
- (void)setCanSubstituteOtherAttributes:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setDisplayPartnerAttributes:(id)a3;
- (void)setDisplayPriority:(unint64_t)a3;
- (void)setHasFlexibleContentSize:(BOOL)a3;
- (void)setIncluded:(BOOL)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setNextAttributesInLayoutOrder:(id)a3;
- (void)setNextAttributesInPriorityOrder:(id)a3;
- (void)setPrefersSecondaryMaterialOverlay:(BOOL)a3;
- (void)setTrailingInterItemSpace:(double)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation AVLayoutItemAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_nextAttributesInPriorityOrder);
  objc_storeStrong((id *)&self->_nextAttributesInLayoutOrder, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);

  objc_destroyWeak((id *)&self->_displayPartnerAttributes);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setNextAttributesInPriorityOrder:(id)a3
{
}

- (AVLayoutItemAttributes)nextAttributesInPriorityOrder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextAttributesInPriorityOrder);

  return (AVLayoutItemAttributes *)WeakRetained;
}

- (void)setNextAttributesInLayoutOrder:(id)a3
{
}

- (AVLayoutItemAttributes)nextAttributesInLayoutOrder
{
  return self->_nextAttributesInLayoutOrder;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setTrailingInterItemSpace:(double)a3
{
  self->_trailingInterItemSpace = a3;
}

- (double)trailingInterItemSpace
{
  return self->_trailingInterItemSpace;
}

- (void)setIncluded:(BOOL)a3
{
  self->_included = a3;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->_minimumSize = a3;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanSubstituteOtherAttributes:(BOOL)a3
{
  self->_canSubstituteOtherAttributes = a3;
}

- (BOOL)canSubstituteOtherAttributes
{
  return self->_canSubstituteOtherAttributes;
}

- (void)setCanOnlyAppearInControlOverflowMenu:(BOOL)a3
{
  self->_canOnlyAppearInControlOverflowMenu = a3;
}

- (BOOL)canOnlyAppearInControlOverflowMenu
{
  return self->_canOnlyAppearInControlOverflowMenu;
}

- (void)setCanOverflowToAuxiliaryMenu:(BOOL)a3
{
  self->_canOverflowToAuxiliaryMenu = a3;
}

- (BOOL)canOverflowToAuxiliaryMenu
{
  return self->_canOverflowToAuxiliaryMenu;
}

- (void)setPrefersSecondaryMaterialOverlay:(BOOL)a3
{
  self->_prefersSecondaryMaterialOverlay = a3;
}

- (BOOL)prefersSecondaryMaterialOverlay
{
  return self->_prefersSecondaryMaterialOverlay;
}

- (void)setHasFlexibleContentSize:(BOOL)a3
{
  self->_hasFlexibleContentSize = a3;
}

- (BOOL)hasFlexibleContentSize
{
  return self->_hasFlexibleContentSize;
}

- (void)setDisplayPartnerAttributes:(id)a3
{
}

- (AVLayoutItemAttributes)displayPartnerAttributes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayPartnerAttributes);

  return (AVLayoutItemAttributes *)WeakRetained;
}

- (void)setDisplayPriority:(unint64_t)a3
{
  self->_displayPriority = a3;
}

- (unint64_t)displayPriority
{
  return self->_displayPriority;
}

- (id)debugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)AVLayoutItemAttributes;
  v3 = [(AVLayoutItemAttributes *)&v10 debugDescription];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVLayoutItemAttributes *)self accessibilityIdentifier];
  [(AVLayoutItemAttributes *)self minimumSize];
  v6 = NSStringFromSize(v12);
  v7 = @"NO";
  if ([(AVLayoutItemAttributes *)self isCollapsed]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(AVLayoutItemAttributes *)self isIncluded]) {
    v7 = @"YES";
  }
  [v4 appendFormat:@"{accessibilityID: %@ minSize: %@ isCollapsed: %@ isIncluded: %@ displayPriority: %ld}", v5, v6, v8, v7, -[AVLayoutItemAttributes displayPriority](self, "displayPriority")];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(AVLayoutItemAttributes *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVLayoutItemAttributes;
  unsigned __int8 v5 = [(AVLayoutItemAttributes *)&v9 isEqual:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 uniqueIdentifier];
    v7 = [(AVLayoutItemAttributes *)self uniqueIdentifier];
    unsigned __int8 v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[AVLayoutItemAttributes allocWithZone:a3] init];
  [(AVLayoutItemAttributes *)self minimumSize];
  -[AVLayoutItemAttributes setMinimumSize:](v4, "setMinimumSize:");
  [(AVLayoutItemAttributes *)self trailingInterItemSpace];
  -[AVLayoutItemAttributes setTrailingInterItemSpace:](v4, "setTrailingInterItemSpace:");
  [(AVLayoutItemAttributes *)v4 setCollapsed:[(AVLayoutItemAttributes *)self isCollapsed]];
  [(AVLayoutItemAttributes *)v4 setIncluded:[(AVLayoutItemAttributes *)self isIncluded]];
  unsigned __int8 v5 = [(AVLayoutItemAttributes *)self uniqueIdentifier];
  [(AVLayoutItemAttributes *)v4 setUniqueIdentifier:v5];

  [(AVLayoutItemAttributes *)v4 setHasFlexibleContentSize:[(AVLayoutItemAttributes *)self hasFlexibleContentSize]];
  [(AVLayoutItemAttributes *)v4 setDisplayPriority:[(AVLayoutItemAttributes *)self displayPriority]];
  v6 = [(AVLayoutItemAttributes *)self accessibilityIdentifier];
  [(AVLayoutItemAttributes *)v4 setAccessibilityIdentifier:v6];

  [(AVLayoutItemAttributes *)v4 setPrefersSecondaryMaterialOverlay:[(AVLayoutItemAttributes *)self prefersSecondaryMaterialOverlay]];
  v7 = [(AVLayoutItemAttributes *)self displayPartnerAttributes];
  [(AVLayoutItemAttributes *)v4 setDisplayPartnerAttributes:v7];

  v8 = [(AVLayoutItemAttributes *)self nextAttributesInLayoutOrder];
  [(AVLayoutItemAttributes *)v4 setNextAttributesInLayoutOrder:v8];

  objc_super v9 = [(AVLayoutItemAttributes *)self nextAttributesInPriorityOrder];
  [(AVLayoutItemAttributes *)v4 setNextAttributesInPriorityOrder:v9];

  [(AVLayoutItemAttributes *)v4 setCanOverflowToAuxiliaryMenu:[(AVLayoutItemAttributes *)self canOverflowToAuxiliaryMenu]];
  [(AVLayoutItemAttributes *)v4 setCanSubstituteOtherAttributes:[(AVLayoutItemAttributes *)self canSubstituteOtherAttributes]];
  return v4;
}

- (BOOL)isCollapsedOrExcluded
{
  if ([(AVLayoutItemAttributes *)self isCollapsed]) {
    return 1;
  }
  else {
    return ![(AVLayoutItemAttributes *)self isIncluded];
  }
}

- (AVLayoutItemAttributes)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVLayoutItemAttributes;
  v2 = [(AVLayoutItemAttributes *)&v8 init];
  unint64_t v3 = (AVLayoutItemAttributes *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E4F1DB30];
    *((void *)v2 + 4) = 0;
    *(_WORD *)(v2 + 13) = 256;
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v5 = [v4 globallyUniqueString];
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v5;

    v3->_hasFlexibleContentSize = 0;
    v3->_displayPriority = 0;
    objc_storeWeak((id *)&v3->_displayPartnerAttributes, 0);
    v3->_canOverflowToAuxiliaryMenu = 0;
    v3->_canSubstituteOtherAttributes = 0;
  }
  return v3;
}

@end