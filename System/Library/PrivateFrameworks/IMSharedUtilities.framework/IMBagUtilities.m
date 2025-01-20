@interface IMBagUtilities
+ (unsigned)getUnsignedIntForKey:(id)a3 withDefault:(unsigned int)a4;
@end

@implementation IMBagUtilities

+ (unsigned)getUnsignedIntForKey:(id)a3 withDefault:(unsigned int)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6B598], "sharedInstanceForBagType:", 1), "objectForKey:", a3);
  if (v5)
  {
    v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      return [v6 unsignedIntegerValue];
    }
  }
  return a4;
}

@end