@interface SADDomainResolver
- (id)eligibilityForDomain:(unint64_t)a3 error:(id *)a4;
@end

@implementation SADDomainResolver

- (id)eligibilityForDomain:(unint64_t)a3 error:(id *)a4
{
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    if (a4)
    {
      uint64_t v7 = domain_answer;
      strerror(domain_answer);
      _CreateError((uint64_t)"-[SADDomainResolver eligibilityForDomain:error:]", 134, NSPOSIXErrorDomain, v7, 0, 0, @"Failed to read eligibility for %llu with error: %s", v8, a3);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      *a4 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = +[NSNumber numberWithUnsignedLongLong:0];
  }

  return v10;
}

@end