@interface NSMapTable
@end

@implementation NSMapTable

id __47__NSMapTable_HFDebugging__hf_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 objectForKey:v3];
  v5 = NSString;
  v6 = objc_msgSend(v3, "hf_prettyDescription");

  v7 = objc_msgSend(v4, "hf_prettyDescription");
  v8 = [v5 stringWithFormat:@"%@ -> %@", v6, v7];

  return v8;
}

id __56__NSMapTable_HFDebugging__hf_prettyExpensiveDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 objectForKey:v3];
  v5 = NSString;
  v6 = objc_msgSend(v3, "hf_prettyExpensiveDescription");

  v7 = objc_msgSend(v4, "hf_prettyExpensiveDescription");
  v8 = [v5 stringWithFormat:@"%@ -> %@", v6, v7];

  return v8;
}

id __51__NSMapTable_HFDebugging__hf_prettyFullDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 objectForKey:v3];
  v5 = NSString;
  v6 = objc_msgSend(v3, "hf_prettyFullDescription");

  v7 = objc_msgSend(v4, "hf_prettyFullDescription");
  v8 = [v5 stringWithFormat:@"%@ -> %@", v6, v7];

  return v8;
}

@end