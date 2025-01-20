@interface ICDTrashEnumerator
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation ICDTrashEnumerator

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" from page %llu", objc_msgSend(v6, "br_pageTokenOffset"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1000456C0;
  }
  memset(v24, 0, sizeof(v24));
  sub_10001E454(0, (uint64_t)"-[ICDTrashEnumerator enumerateItemsForObserver:startingAtPage:]", 31, v24);
  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v24[0];
    __int16 v27 = 2112;
    v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx listing trashed items%@%@", buf, 0x20u);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000081A4;
  v21[3] = &unk_100044700;
  id v11 = v5;
  id v22 = v11;
  id v12 = v7;
  id v23 = v12;
  v13 = objc_retainBlock(v21);
  id v14 = [v11 suggestedPageSize];
  if ((unint64_t)v14 >= 0xC8) {
    uint64_t v15 = 200;
  }
  else {
    uint64_t v15 = (uint64_t)v14;
  }
  v16 = +[BRDaemonConnection defaultConnection];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000836C;
  v19[3] = &unk_100044728;
  id v17 = v11;
  id v20 = v17;
  v18 = [v16 remoteObjectProxyWithErrorHandler:v19];
  objc_msgSend(v18, "enumerateTrashItemsFromRank:limit:completion:", objc_msgSend(v12, "br_pageTokenOffset"), v15, v13);

  sub_10001E628(v24);
}

@end