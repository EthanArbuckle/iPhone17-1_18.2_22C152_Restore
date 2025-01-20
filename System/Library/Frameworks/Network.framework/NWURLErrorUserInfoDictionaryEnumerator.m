@interface NWURLErrorUserInfoDictionaryEnumerator
- (NSEnumerator)userInfoKeyEnumerator;
- (NWURLError)error;
- (id)nextObject;
- (void)setError:(id)a3;
- (void)setUserInfoKeyEnumerator:(id)a3;
@end

@implementation NWURLErrorUserInfoDictionaryEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoKeyEnumerator, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setUserInfoKeyEnumerator:(id)a3
{
}

- (NSEnumerator)userInfoKeyEnumerator
{
  return self->_userInfoKeyEnumerator;
}

- (void)setError:(id)a3
{
}

- (NWURLError)error
{
  return self->_error;
}

- (id)nextObject
{
  v3 = [(NWURLErrorUserInfoDictionaryEnumerator *)self userInfoKeyEnumerator];
  v4 = [v3 nextObject];

  if (v4)
  {
    while (1)
    {
      v5 = +[NWURLError allUserInfoKeys];
      v6 = [v5 objectForKeyedSubscript:v4];
      v7 = NSSelectorFromString(v6);

      v8 = [(NWURLErrorUserInfoDictionaryEnumerator *)self error];
      v9 = [v8 v7];

      if (v9) {
        break;
      }
      v10 = [(NWURLErrorUserInfoDictionaryEnumerator *)self userInfoKeyEnumerator];
      uint64_t v11 = [v10 nextObject];

      v4 = (void *)v11;
      if (!v11) {
        goto LABEL_4;
      }
    }
    id v12 = v4;
  }
  else
  {
LABEL_4:
    id v12 = 0;
  }

  return v12;
}

@end