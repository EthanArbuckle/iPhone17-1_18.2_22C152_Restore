@interface NSString(Regex)
- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlock:;
- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlockWithResult:;
@end

@implementation NSString(Regex)

- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlock:
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlock___block_invoke;
  v10[3] = &unk_1E63658C8;
  v10[4] = a1;
  id v11 = v6;
  id v7 = v6;
  v8 = objc_msgSend(a1, "calc_stringByReplacingOccurrencesOfRegex:usingBlockWithResult:", a3, v10);

  return v8;
}

- (id)calc_stringByReplacingOccurrencesOfRegex:()Regex usingBlockWithResult:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v8 length];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke;
  aBlock[3] = &unk_1E6365668;
  v24 = &v27;
  id v10 = v8;
  id v23 = v10;
  v25 = v26;
  id v11 = _Block_copy(aBlock);
  if (calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__onceToken != -1) {
    dispatch_once(&calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__onceToken, &__block_literal_global_89);
  }
  [(id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock lock];
  v12 = [(id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes objectForKeyedSubscript:v6];
  if (!v12)
  {
    v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v6 options:0 error:0];
    [(id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes setObject:v12 forKeyedSubscript:v6];
  }
  [(id)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock unlock];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_3;
  v18[3] = &unk_1E6365690;
  id v13 = v11;
  id v19 = v13;
  v21 = &v27;
  id v14 = v7;
  id v20 = v14;
  objc_msgSend(v12, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, v18);
  v15 = v10;
  if (v28[5])
  {
    (*((void (**)(id, uint64_t, void))v13 + 2))(v13, v9, 0);
    v15 = (void *)v28[5];
  }
  id v16 = v15;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  return v16;
}

@end