@interface TypeCheckedDictionaryReader
@end

@implementation TypeCheckedDictionaryReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathCache, 0);
  objc_destroyWeak((id *)&self->_dictionary);
}

@end