@interface CUIDesignLibraryCacheKey:
- (void)CUIDesignLibraryCacheKey.Entry;
@end

@implementation CUIDesignLibraryCacheKey:

- (void)CUIDesignLibraryCacheKey.Entry
{
  if (!lazy cache variable for type metadata for [CUIDesignLibraryCacheKey : CUIDesignLibraryCacheKey.Entry])
  {
    lazy protocol witness table accessor for type CUIDesignLibraryCacheKey and conformance CUIDesignLibraryCacheKey();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [CUIDesignLibraryCacheKey : CUIDesignLibraryCacheKey.Entry]);
    }
  }
}

@end