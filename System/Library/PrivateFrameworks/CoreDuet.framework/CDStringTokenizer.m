@interface CDStringTokenizer
@end

@implementation CDStringTokenizer

void __40___CDStringTokenizer_isEnglishStopWord___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [@"a,able,about,across,after,all,almost,also,am,among,an,and,any,are,as,at,be,because,been,but,by,can,cannot,could,dear,did,do,does,either,else,ever,every,for,from,get,got,had,has,have,he,her,hers,him,his,how,however,i,if,in,into,is,it,its,just,least,let,like,likely,may,me,might,most,must,my,neither,no,nor,not,of,off,often,on,only,or,other,our,own,rather,said,say,says,she,should,since,so,some,than,that,the,their,them,then,there,these,they,this,tis,to,too,twas,us,wants,was,we,were,what,when,where,which,while,who,whom,why,will,with,would,yet,you,your" componentsSeparatedByString:@","];
  uint64_t v1 = [v0 setWithArray:v3];
  v2 = (void *)isEnglishStopWord___stopWordSet;
  isEnglishStopWord___stopWordSet = v1;
}

@end