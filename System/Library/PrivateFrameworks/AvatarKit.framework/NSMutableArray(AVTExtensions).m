@interface NSMutableArray(AVTExtensions)
- (void)avt_applyPoseRoundingBehaviour;
@end

@implementation NSMutableArray(AVTExtensions)

- (void)avt_applyPoseRoundingBehaviour
{
  _AVTPoseRoundingBehaviour();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [a1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = [a1 objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = objc_msgSend(v5, "avt_numberByRoundingWithBehavior:", v7);
        [a1 setObject:v6 atIndexedSubscript:i];
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v5, "avt_applyPoseRoundingBehaviour");
      }
    }
  }
}

@end