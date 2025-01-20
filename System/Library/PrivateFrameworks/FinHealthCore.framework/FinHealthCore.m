id CreateTablesAndIndexes()
{
  void *v0;
  uint64_t vars8;

  if (CreateTablesAndIndexes_onceToken != -1) {
    dispatch_once(&CreateTablesAndIndexes_onceToken, &__block_literal_global);
  }
  v0 = (void *)CreateTablesAndIndexes__ddlCreateTables;
  return v0;
}

void __CreateTablesAndIndexes_block_invoke()
{
  v16 = (void *)MEMORY[0x263EFF8C0];
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"transactions",
  v33 = @"(t_tid integer primary key autoincrement, t_identifier text, t_service_identifier text, t_finance_transaction_id text, t_payment_hash text, t_source_identifier text, t_amount integer, t_currencycode text, t_timezone integer, t_date integer, t_status integer, t_status_changed_date integer, t_source integer, t_card_type integer, t_type integer, a_type integer, t_altDSID text, t_receipt_identifier text, t_associated_receipt_unique_id text, t_fh_internal_state integer, m_merchant_identifier text, m_industrycode integer, m_name text, m_raw_name text, m_category integer, m_detailed_category text, m_displayname text, m_street text, m_city text, m_state text, m_zip text, m_country_code text, m_country text, m_maps_merchant_id text, m_maps_merchant_result_id integer, m_maps_merchant_brand_id text, m_maps_merchant_brand_result_id integer, lat real, long real, v_accuracy real, h_accuracy real, dispute_type integer, dispute_status integer, peer_pay_counterpart text, peer_pay_type integer, t_description text, peer_pay_is_recurring integer, dispute_open_date integer, dispute_last_updated_date integer)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"transaction_features",
  v32 = @"(t_identifier text primary key, t_features text, t_compound_features text, locale text, t_mark_for_delete integer, t_finance_transaction_id text)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_deterministic_realtime",
  v31 = @"(f1_tid integer primary key autoincrement, t_identifier text UNIQUE, a integer, b integer, c integer, f integer, g integer)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_predicted_realtime",
  v30 = @"(f2_tid integer primary key autoincrement, identifier text, feature_name text, feature_predicted_class integer, version text, data_type integer, predicted_score real, UNIQUE(identifier, feature_name, feature_predicted_class, version))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_prediction_labels",
  v29 = @"(feature_label_id integer primary key autoincrement, feature_name text, feature_predicted_class integer, smart_feature_name text, UNIQUE(feature_name, feature_predicted_class, smart_feature_name))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_compound_realtime",
  v28 = @"(f3_tid integer primary key autoincrement, t_identifier text UNIQUE, t_compound_feature_value text)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_merchant",
  v27 = @"(merchant_aggregate_id integer primary key autoincrement, merchant_aggregate_type text, merchant_aggregate_value text, start_date integer, end_date integer, UNIQUE(merchant_aggregate_type, start_date, end_date))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_detailed_category",
  v26 = @"(category_aggregate_id integer primary key autoincrement, detailed_category text, amount integer, transaction_count integer, country_code text, recurring_transaction_ratio real, time_of_day integer, time_window integer, start_date real, end_date real,  UNIQUE(detailed_category, time_of_day, time_window, country_code))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_datetime",
  v24 = @"(datetime_aggregate_id integer primary key autoincrement, datetime_aggregate_type text, datetime_aggregate_value_start_date integer, datetime_aggregate_value_end_date integer, start_date integer, end_date integer, UNIQUE(datetime_aggregate_type, start_date, end_date))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_amount",
  v25 = @"(amount_aggregate_id integer primary key autoincrement, amount_aggregate_type text, amount_aggregate_value integer, comparison_operator text, start_date integer, end_date integer, UNIQUE(amount_aggregate_type, start_date, end_date))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_schema",
  v23 = @"(sch_id integer primary key autoincrement, sch_version_id text, sch_upgrade_status integer, sch_date integer, sch_getall_status integer)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_heuristics",
  v22 = @"(h_id integer primary key autoincrement, t_identifier text , t_heuristics_identifier text, t_heuristics_value integer, t_heuristics_score real, UNIQUE(t_identifier, t_heuristics_identifier))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_instrumentation",
  v15 = @"(inst_id integer primary key autoincrement, tag_source integer, tag_type integer, tag_click_date integer, pass_type integer, heuristics_identifier text, account_state integer, paid_using_ring integer)");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_events",
  v21 = @"(e_id integer primary key autoincrement, e_identifier text, start_date integer, end_date integer, UNIQUE(e_identifier, start_date, end_date))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_processing_history",
  v14 = @"(fh_processing_history_id integer primary key autoincrement, feature_name text, feature_processing_date integer, feature_data text, UNIQUE(feature_name))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_peer_payments",
  v20 = @"(p1_tid integer primary key autoincrement, source_identifier text, peer_pay_counterpart text, amount integer, frequency real, peer_pay_type integer, forecast_date integer, forecast_signal_type integer, heuristics_identifier text, UNIQUE(heuristics_identifier))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"features_insight_trends",
  v13 = @"(trend_pid integer primary key autoincrement, trend_date real, trend_direction integer, trend_feature_name text, trend_feature_type text, trend_spend real, trend_window integer, trend_average real, trend_readable_description text)");
  objc_msgSend(NSString, "stringWithFormat:", @"create index %@ on %@(%@);",
    @"t_date_index",
    @"transactions",
  v19 = @"t_date");
  objc_msgSend(NSString, "stringWithFormat:", @"create index %@ on %@(%@);",
    @"t_identifier_index",
    @"transactions",
  v12 = @"t_identifier");
  objc_msgSend(NSString, "stringWithFormat:", @"create index %@ on %@(%@);",
    @"t_finance_transaction_id_index",
    @"transactions",
  v11 = @"t_finance_transaction_id");
  objc_msgSend(NSString, "stringWithFormat:", @"create index %@ on %@(%@);",
    @"identifier_index",
    @"features_predicted_realtime",
  v18 = @"identifier");
  objc_msgSend(NSString, "stringWithFormat:", @"create index %@ on %@(%@);",
    @"pattern_class_index",
    @"features_predicted_realtime",
  v17 = @"feature_predicted_class");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_account_information",
  v10 = @"(source_identifier text primary key, account_type integer, account_balance integer, source_type, account_currency_code text, account_date integer, account_category integer, account_description text, account_status integer, credit_limit integer, next_payment_date real, minimum_payment_amount integer, overdue_payment_amount integer, institution_name text, institution_id text, unique_account_id text, UNIQUE(institution_id, unique_account_id))");
  v9 = [NSString stringWithFormat:@"%@", @"CREATE VIRTUAL TABLE fts_transactions USING fts5(t_identifier UNINDEXED, t_source_identifier UNINDEXED, a_type UNINDEXED, t_description, content=transactions, content_rowid=t_tid)"];;
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_grouping",
  v8 = @"(g_id integer primary key autoincrement,t_identifier text, group_id integer, similarity_score text, group_type integer, UNIQUE(t_identifier, group_id))");
  v7 = [NSString stringWithFormat:@"%@", @"CREATE TRIGGER transactions_ai AFTER INSERT ON transactions BEGIN INSERT INTO fts_transactions(rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES (new.t_tid, new.t_identifier, new.t_source_identifier, new.a_type, new.t_description); END;"];
  v0 = [NSString stringWithFormat:@"%@", @"CREATE TRIGGER transactions_bu BEFORE UPDATE ON transactions BEGIN INSERT INTO fts_transactions(fts_transactions, rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES('delete', old.t_tid, old.t_identifier, old.t_source_identifier, old.a_type, old.t_description); END;"];
  v1 = [NSString stringWithFormat:@"%@", @"CREATE TRIGGER transactions_bd BEFORE DELETE ON transactions BEGIN INSERT INTO fts_transactions(fts_transactions, rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES('delete', old.t_tid, old.t_identifier, old.t_source_identifier, old.a_type, old.t_description); END;"];
  v2 = [NSString stringWithFormat:@"%@", @"CREATE TRIGGER transactions_au AFTER UPDATE ON transactions BEGIN INSERT INTO fts_transactions(rowid, t_identifier, t_source_identifier, a_type, t_description) VALUES (new.t_tid, new.t_identifier, new.t_source_identifier, new.a_type, new.t_description); END;"];
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_card_recurring_predictions",
  v3 = @"(source_identifier text, merchant text, detailed_category text, amount integer, frequency real, transaction_type integer, transaction_source integer, forecast_date real, forecast_signal_type integer, heuristic_identifier text, UNIQUE(heuristic_identifier))");
  objc_msgSend(NSString, "stringWithFormat:", @"create table %@ %@;",
    @"fh_receipt_data",
  v4 = @"(fhr_id integer primary key autoincrement, receiptIdentifier text, line_item_index text, title text, subtitle text, quantity integer, amount integer, currencyCode text, adamIdentifier integer, UNIQUE(receiptIdentifier, line_item_index))");
  objc_msgSend(v16, "arrayWithObjects:", v33, v32, v31, v30, v29, v28, v27, v26, v24, v25, v23, v22, v15, v21, v14, v20, v13,
    v19,
    v12,
    v11,
    v18,
    v17,
    v10,
    v9,
    v8,
    v7,
    v0,
    v1,
    v2,
    v3,
    v4,
  uint64_t v5 = 0);
  v6 = (void *)CreateTablesAndIndexes__ddlCreateTables;
  CreateTablesAndIndexes__ddlCreateTables = v5;
}

id DropTablesAndIndexes()
{
  if (DropTablesAndIndexes_onceToken != -1) {
    dispatch_once(&DropTablesAndIndexes_onceToken, &__block_literal_global_73);
  }
  v0 = (void *)DropTablesAndIndexes__ddlDropTables;
  return v0;
}

void __DropTablesAndIndexes_block_invoke()
{
  v14 = (void *)MEMORY[0x263EFF8C0];
  v28 = [NSString stringWithFormat:@"drop table if exists %@;", @"fh_schema"];
  v27 = [NSString stringWithFormat:@"drop table if exists %@;", @"transactions"];
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v26 = @"transaction_features");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v24 = @"features_deterministic_realtime");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v25 = @"features_prediction_labels");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v23 = @"features_compound_realtime");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v22 = @"features_predicted_realtime");
  v21 = [NSString stringWithFormat:@"drop table if exists %@;", @"features_merchant"];
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v13 = @"features_detailed_category");
  v20 = [NSString stringWithFormat:@"drop table if exists %@;", @"features_datetime"];
  v12 = [NSString stringWithFormat:@"drop table if exists %@;", @"features_amount"];
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v19 = @"features_heuristics");
  v11 = [NSString stringWithFormat:@"drop table if exists %@;", @"features_events"];
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v18 = @"features_instrumentation");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v10 = @"fh_processing_history");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v17 = @"features_peer_payments");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v16 = @"features_insight_trends");
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v15 = @"fh_account_information");
  v9 = [NSString stringWithFormat:@"drop table if exists %@;", @"fh_grouping"];
  v8 = [NSString stringWithFormat:@"drop table if exists %@;", @"fts_transactions"];
  v0 = [NSString stringWithFormat:@"drop trigger %@;", @"transactions_au"];
  v1 = [NSString stringWithFormat:@"drop trigger %@;", @"transactions_ai"];
  v2 = [NSString stringWithFormat:@"drop trigger %@;", @"transactions_bd"];
  v3 = [NSString stringWithFormat:@"drop trigger %@;", @"transactions_bu"];
  objc_msgSend(NSString, "stringWithFormat:", @"drop table if exists %@;",
  v4 = @"fh_card_recurring_predictions");
  uint64_t v5 = [NSString stringWithFormat:@"drop table if exists %@;", @"fh_receipt_data"];
  objc_msgSend(v14, "arrayWithObjects:", v28, v27, v26, v24, v25, v23, v22, v21, v13, v20, v12, v19, v11, v18, v10, v17, v16,
    v15,
    v9,
    v8,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
  uint64_t v6 = 0);
  v7 = (void *)DropTablesAndIndexes__ddlDropTables;
  DropTablesAndIndexes__ddlDropTables = v6;
}

void sub_24E02CC7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_24E02FB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E03005C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E0306A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E032EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_24E03381C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_24E034368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_24E034F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

void sub_24E037B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E037CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E0380EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v30 - 160), 8);
  _Block_object_dispose((const void *)(v30 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_24E038B30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_24E039274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E039DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_24E03B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_24E03C298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24E03C8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_24E03CAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_24E03DB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_24E03DCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FinHealthLogObject(void *a1)
{
  uint64_t v1 = FinHealthLogObject___once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&FinHealthLogObject___once, &__block_literal_global_0);
  }
  v3 = FinHealthLogFacilities();
  uint64_t v4 = [v3 indexOfObject:v2];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = (id)FinHealthLogObject_logObjects[v5];
  return v6;
}

uint64_t __FinHealthLogObject_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FinHealth", (const char *)[@"FinHealthClient" UTF8String]);
  uint64_t v1 = (void *)FinHealthLogObject_logObjects[0];
  FinHealthLogObject_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.FinHealth", (const char *)[@"FinHealthServer" UTF8String]);
  v3 = (void *)qword_26B1AE1F0;
  qword_26B1AE1F0 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.FinHealth", (const char *)[@"FinHealthSQL" UTF8String]);
  uint64_t v5 = (void *)qword_26B1AE1F8;
  qword_26B1AE1F8 = (uint64_t)v4;

  qword_26B1AE200 = (uint64_t)os_log_create("com.apple.FinHealth", (const char *)[@"FinHealthCore" UTF8String]);
  return MEMORY[0x270F9A758]();
}

id FinHealthLogFacilities()
{
  if (FinHealthLogFacilities___once != -1) {
    dispatch_once(&FinHealthLogFacilities___once, &__block_literal_global_12);
  }
  os_log_t v0 = (void *)FinHealthLogFacilities_logFacilities;
  return v0;
}

void __FinHealthLogFacilities_block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"FinHealthClient";
  v2[1] = @"FinHealthServer";
  v2[2] = @"FinHealthSQL";
  v2[3] = @"FinHealthCore";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  uint64_t v1 = (void *)FinHealthLogFacilities_logFacilities;
  FinHealthLogFacilities_logFacilities = v0;
}

void sub_24E04061C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FHTransactionTimeOfDayFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"EarlyMorning"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Morning"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Daytime"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Evening"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Nighttime"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *FHTransactionTimeOfDayToString(unint64_t a1)
{
  if (a1 > 5) {
    return @"unknown";
  }
  else {
    return off_265314D50[a1];
  }
}

__CFString *FHTransactionRepeatingPatternClassToFHSmartFeature(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      uint64_t v2 = FHSmartFeatureAggregateTypeRecurring;
      goto LABEL_3;
    case 1:
      uint64_t v2 = FHSmartFeatureAggregateTypeRegular;
      goto LABEL_3;
    case 2:
      uint64_t v2 = FHSmartFeatureAggregateTypeIrregular;
LABEL_3:
      v3 = *v2;
      goto LABEL_4;
    case 11:
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", 11);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

id loadConfigurationFromJsonFile(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  os_log_t v4 = [v3 bundlePath];

  uint64_t v5 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_DEBUG, "bundle path: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  v7 = [v6 pathForResource:v2 ofType:@"json" inDirectory:@"FeaturesResources"];

  v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7];

  return v8;
}

id FHSmartFeaturesDict()
{
  if (FHSmartFeaturesDict_onceToken != -1) {
    dispatch_once(&FHSmartFeaturesDict_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)FHSmartFeaturesDict_fhSmartFeaturesDict;
  return v0;
}

void __FHSmartFeaturesDict_block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_8;
  }
  uint64_t v0 = [[FHExperiment alloc] initWithNamespaceName:@"WPC_ANALYTICS_FHCONFIGS"];
  uint64_t v1 = [(FHExperiment *)v0 getFilePathForFactor:@"FH_CONFIG_ROLLOUT"];
  if (!v1)
  {

LABEL_8:
    uint64_t v5 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24E029000, v5, OS_LOG_TYPE_DEBUG, "Loading features.json data from default resource.", buf, 2u);
    }

    v3 = loadConfigurationFromJsonFile(@"assets_1671/features");
    goto LABEL_11;
  }
  id v2 = (void *)v1;
  v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v1];
  os_log_t v4 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v2;
    _os_log_impl(&dword_24E029000, v4, OS_LOG_TYPE_DEBUG, "Loading path: %@ for features.json data from Turi", buf, 0xCu);
  }

  if (!v3) {
    goto LABEL_8;
  }
LABEL_11:
  id v12 = 0;
  uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:1 error:&v12];
  id v7 = v12;
  v8 = (void *)FHSmartFeaturesDict_fhSmartFeaturesDict;
  FHSmartFeaturesDict_fhSmartFeaturesDict = v6;

  uint64_t v9 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = [(id)FHSmartFeaturesDict_fhSmartFeaturesDict allKeys];
    *(_DWORD *)buf = 138412290;
    id v14 = v10;
    _os_log_impl(&dword_24E029000, v9, OS_LOG_TYPE_DEBUG, "[fhSmartFeaturesDict allKeys]: %@", buf, 0xCu);
  }
  if (!FHSmartFeaturesDict_fhSmartFeaturesDict)
  {
    v11 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_24E029000, v11, OS_LOG_TYPE_ERROR, "Error parsing JSON: %@", buf, 0xCu);
    }
  }
}

id FHMerchantSmartFeaturesArray()
{
  if (FHMerchantSmartFeaturesArray_onceToken != -1) {
    dispatch_once(&FHMerchantSmartFeaturesArray_onceToken, &__block_literal_global_157);
  }
  uint64_t v0 = (void *)FHMerchantSmartFeaturesArray__fhSmartFeatures;
  return v0;
}

void __FHMerchantSmartFeaturesArray_block_invoke()
{
  FHSmartFeaturesDict();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 objectForKey:@"FHMerchantSmartFeatures"];
  uint64_t v1 = [v0 allKeys];
  id v2 = (void *)FHMerchantSmartFeaturesArray__fhSmartFeatures;
  FHMerchantSmartFeaturesArray__fhSmartFeatures = v1;
}

id FHAmountSmartFeaturesArray()
{
  if (FHAmountSmartFeaturesArray_onceToken != -1) {
    dispatch_once(&FHAmountSmartFeaturesArray_onceToken, &__block_literal_global_159);
  }
  uint64_t v0 = (void *)FHAmountSmartFeaturesArray__fhSmartFeatures;
  return v0;
}

void __FHAmountSmartFeaturesArray_block_invoke()
{
  FHSmartFeaturesDict();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 objectForKey:@"FHAmountSmartFeatures"];
  uint64_t v1 = [v0 allKeys];
  id v2 = (void *)FHAmountSmartFeaturesArray__fhSmartFeatures;
  FHAmountSmartFeaturesArray__fhSmartFeatures = v1;
}

id FHDateTimeSmartFeaturesArray()
{
  if (FHDateTimeSmartFeaturesArray_onceToken != -1) {
    dispatch_once(&FHDateTimeSmartFeaturesArray_onceToken, &__block_literal_global_161);
  }
  uint64_t v0 = (void *)FHDateTimeSmartFeaturesArray__fhSmartFeatures;
  return v0;
}

void __FHDateTimeSmartFeaturesArray_block_invoke()
{
  FHSmartFeaturesDict();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v3 objectForKey:@"FHDateTimeSmartFeatures"];
  uint64_t v1 = [v0 allKeys];
  id v2 = (void *)FHDateTimeSmartFeaturesArray__fhSmartFeatures;
  FHDateTimeSmartFeaturesArray__fhSmartFeatures = v1;
}

id FHRepeatingAggregateFeatureSet()
{
  if (FHRepeatingAggregateFeatureSet_onceToken != -1) {
    dispatch_once(&FHRepeatingAggregateFeatureSet_onceToken, &__block_literal_global_163);
  }
  uint64_t v0 = (void *)FHRepeatingAggregateFeatureSet__fhSmartFeatures;
  return v0;
}

uint64_t __FHRepeatingAggregateFeatureSet_block_invoke()
{
  FHRepeatingAggregateFeatureSet__fhSmartFeatures = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"FHSmartFeatureAggregateTypeRecurring", @"FHSmartFeatureAggregateTypeRegular", @"FHSmartFeatureAggregateTypeIrregular", 0);
  return MEMORY[0x270F9A758]();
}

id FHMultiClassPredictionsSmartFeaturesArray()
{
  if (FHMultiClassPredictionsSmartFeaturesArray_onceToken != -1) {
    dispatch_once(&FHMultiClassPredictionsSmartFeaturesArray_onceToken, &__block_literal_global_166);
  }
  uint64_t v0 = (void *)FHMultiClassPredictionsSmartFeaturesArray__fhSmartFeatures;
  return v0;
}

uint64_t __FHMultiClassPredictionsSmartFeaturesArray_block_invoke()
{
  FHMultiClassPredictionsSmartFeaturesArray__fhSmartFeatures = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"FHSmartFeatureAggregateTypeRecurring", @"FHSmartFeatureAggregateTypeRegular", @"FHSmartFeatureAggregateTypeIrregular", 0);
  return MEMORY[0x270F9A758]();
}

id FHMultiClassPredictionsSmartFeaturesAsString()
{
  if (FHMultiClassPredictionsSmartFeaturesAsString_onceToken != -1) {
    dispatch_once(&FHMultiClassPredictionsSmartFeaturesAsString_onceToken, &__block_literal_global_169);
  }
  uint64_t v0 = (void *)FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures;
  return v0;
}

void __FHMultiClassPredictionsSmartFeaturesAsString_block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = FHMultiClassPredictionsSmartFeaturesArray();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
        objc_msgSend(v0, "appendString:", @"\"", (void)v9);
        [v0 appendString:v6];
        [v0 appendString:@"\","];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  if ([v0 length]) {
    objc_msgSend(v0, "substringToIndex:", objc_msgSend(v0, "length") - 1);
  }
  else {
  uint64_t v7 = [NSString stringWithString:v0];
  }
  v8 = (void *)FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures;
  FHMultiClassPredictionsSmartFeaturesAsString__commaSeparatedBinaryPredictionsSmartFeatures = v7;
}

id FHApplicationToTagsMapping()
{
  if (FHApplicationToTagsMapping_onceToken != -1) {
    dispatch_once(&FHApplicationToTagsMapping_onceToken, &__block_literal_global_178);
  }
  uint64_t v0 = (void *)FHApplicationToTagsMapping_fhFeaturesForApplications;
  return v0;
}

void __FHApplicationToTagsMapping_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v0 = loadConfigurationFromJsonFile(@"features_for_applications");
  id v5 = 0;
  uint64_t v1 = [MEMORY[0x263F08900] JSONObjectWithData:v0 options:1 error:&v5];
  id v2 = v5;
  uint64_t v3 = (void *)FHApplicationToTagsMapping_fhFeaturesForApplications;
  FHApplicationToTagsMapping_fhFeaturesForApplications = v1;

  if (!FHApplicationToTagsMapping_fhFeaturesForApplications)
  {
    uint64_t v4 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_24E029000, v4, OS_LOG_TYPE_ERROR, "Error parsing JSON: %@", buf, 0xCu);
    }
  }
}

id FHApplications()
{
  if (FHApplications_onceToken != -1) {
    dispatch_once(&FHApplications_onceToken, &__block_literal_global_183);
  }
  uint64_t v0 = (void *)FHApplications_fhApplications;
  return v0;
}

uint64_t __FHApplications_block_invoke()
{
  FHApplications_fhApplications = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Search", @"Payment Ring", @"Messaging", @"Test Client", 0);
  return MEMORY[0x270F9A758]();
}

id FHCleanSuperMerchants()
{
  if (FHCleanSuperMerchants_onceToken != -1) {
    dispatch_once(&FHCleanSuperMerchants_onceToken, &__block_literal_global_185);
  }
  uint64_t v0 = (void *)FHCleanSuperMerchants_fhSuperMerchants;
  return v0;
}

uint64_t __FHCleanSuperMerchants_block_invoke()
{
  FHCleanSuperMerchants_fhSuperMerchants = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"uber", @"ubereats", @"nike", @"panera", @"exxon", @"mobil", @"acehardware", @"walgreens", @"duanereade", 0);
  return MEMORY[0x270F9A758]();
}

id FHSuperMerchants()
{
  if (FHSuperMerchants_onceToken != -1) {
    dispatch_once(&FHSuperMerchants_onceToken, &__block_literal_global_214);
  }
  uint64_t v0 = (void *)FHSuperMerchants_fhSuperMerchants;
  return v0;
}

uint64_t __FHSuperMerchants_block_invoke()
{
  FHSuperMerchants_fhSuperMerchants = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Uber", @"Uber Eats", @"Nike", @"Panera", @"Exxon", @"Mobil", @"Ace Hardware", @"Walgreens", @"Duane Reade", 0);
  return MEMORY[0x270F9A758]();
}

id getCleanMerchantName(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  uint64_t v3 = [v1 characterSetWithCharactersInString:@"!@#$%^&*()_+|"];
  uint64_t v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 componentsJoinedByString:&stru_27001CD40];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_27001CD40];
  id v7 = [v6 lowercaseString];

  return v7;
}

id FHMerchantsUnaffectedBySource()
{
  if (FHMerchantsUnaffectedBySource_onceToken != -1) {
    dispatch_once(&FHMerchantsUnaffectedBySource_onceToken, &__block_literal_global_250);
  }
  uint64_t v0 = (void *)FHMerchantsUnaffectedBySource_fhMerchantsUnaffectedBySource;
  return v0;
}

uint64_t __FHMerchantsUnaffectedBySource_block_invoke()
{
  FHMerchantsUnaffectedBySource_fhMerchantsUnaffectedBySource = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"apple", @"appleservices", 0);
  return MEMORY[0x270F9A758]();
}

__CFString *FHApplicationFromProcessName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"passd"])
  {
    id v2 = @"Search";
  }
  else if ([v1 isEqualToString:@"PassKitUI"])
  {
    id v2 = @"Payment Ring";
  }
  else if ([v1 isEqualToString:@"engagementd"])
  {
    id v2 = @"Messaging";
  }
  else if ([v1 isEqualToString:@"finhealth_client"])
  {
    id v2 = @"Test Client";
  }
  else
  {
    id v2 = @"unknown Client";
  }

  return v2;
}

id FHPeerPaymentForecastingSignalPriority()
{
  if (FHPeerPaymentForecastingSignalPriority_onceToken != -1) {
    dispatch_once(&FHPeerPaymentForecastingSignalPriority_onceToken, &__block_literal_global_273);
  }
  uint64_t v0 = (void *)FHPeerPaymentForecastingSignalPriority_peerPaymentForecastingSignalPriority;
  return v0;
}

uint64_t __FHPeerPaymentForecastingSignalPriority_block_invoke()
{
  FHPeerPaymentForecastingSignalPriority_peerPaymentForecastingSignalPriority = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", &unk_2700273C0, &unk_2700273D8, &unk_2700273F0, &unk_270027408, &unk_270027420, &unk_270027438, &unk_270027450, &unk_270027468, &unk_270027450, &unk_270027480, &unk_270027450, &unk_270027498, &unk_270027450, &unk_2700274B0, &unk_270027450, &unk_2700274C8, 0);
  return MEMORY[0x270F9A758]();
}

uint64_t FHDataDirectory()
{
  uint64_t v0 = (void *)CPSharedResourcesDirectory();
  return [v0 stringByAppendingPathComponent:@"/Library/FinHealth/"];
}

id FHModelDirectory()
{
  uint64_t v0 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/FinHealth/"];
  id v1 = [v0 stringByAppendingPathComponent:@"/mlmodels/"];

  return v1;
}

id GetProcessingDate()
{
  if (GetProcessingDate_onceToken != -1) {
    dispatch_once(&GetProcessingDate_onceToken, &__block_literal_global_300);
  }
  uint64_t v0 = (void *)GetProcessingDate_processingDate;
  return v0;
}

uint64_t __GetProcessingDate_block_invoke()
{
  GetProcessingDate_processingDate = [MEMORY[0x263EFF910] now];
  return MEMORY[0x270F9A758]();
}

double TimeWindowToSeconds(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      double v3 = (double)0xFFFFFFFFFF895900;
      break;
    case 2:
      double v3 = 31536000.0 * -0.5;
      break;
    case 3:
      double v3 = -31536000.0;
      break;
    default:
      id v1 = GetProcessingDate();
      [v1 timeIntervalSinceReferenceDate];
      double v3 = -v2;

      break;
  }
  return v3;
}

uint64_t GetTimeOfDay(void *a1, void *a2)
{
  double v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 currentCalendar];
  [v6 setTimeZone:v4];

  id v7 = [v6 components:636 fromDate:v5];

  unint64_t v8 = [v7 hour];
  if (v8 > 0x18) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_24E059CA0[v8];
  }

  return v9;
}

__CFString *FHMerchantCategoryToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Unknown";
  }
  else {
    return off_265314D80[a1 - 1];
  }
}

uint64_t FHMerchantCategoryFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Food Drinks"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Shopping"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Travel"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Services"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Fun"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Health"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Transport"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *GetDayOfWeekFromSignalDate(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  uint64_t v4 = [v3 component:512 fromDate:v2];

  if ((unint64_t)(v4 - 1) > 6) {
    return @"UNKNOWN";
  }
  else {
    return off_265314DB8[v4 - 1];
  }
}

id GetPeriodicCategoryFromFrequency(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F087B8];
  id v2 = a1;
  double v3 = (void *)[[v1 alloc] initWithRoundingMode:0 scale:0 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:1];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:86400];
  id v5 = [v2 decimalNumberByDividingBy:v4 withBehavior:v3];

  uint64_t v6 = [v5 integerValue];
  if ((unint64_t)(v6 - 6) >= 3)
  {
    if ((unint64_t)(v6 - 13) >= 3)
    {
      if ((unint64_t)(v6 - 27) >= 7) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 5;
      }
    }
    else
    {
      uint64_t v7 = 4;
    }
  }
  else
  {
    uint64_t v7 = 3;
  }
  unint64_t v8 = FHRecurringPeerPaymentPeriodicCategoryTypeToString(v7);

  return v8;
}

id FHDateFromNumberOfDays(void *a1, uint64_t a2)
{
  double v3 = (objc_class *)MEMORY[0x263EFF918];
  id v4 = a1;
  id v5 = objc_alloc_init(v3);
  [v5 setDay:a2];
  uint64_t v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 dateByAddingComponents:v5 toDate:v4 options:0];

  return v7;
}

id FHStartOfYear(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  id v4 = [v3 components:6 fromDate:v2];

  id v5 = [v3 dateFromComponents:v4];

  return v5;
}

id FHStartOfLastYear(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setYear:-1];
  id v5 = [v3 dateByAddingComponents:v4 toDate:v2 options:0];

  uint64_t v6 = FHStartOfYear(v5);

  return v6;
}

id FHDateStartOfWeek(void *a1, uint64_t a2)
{
  double v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a1;
  id v5 = [v3 currentCalendar];
  if ([v5 component:512 fromDate:v4] != a2)
  {
    uint64_t v6 = [v5 nextDateAfterDate:v4 matchingUnit:512 value:a2 options:260];

    id v4 = (id)v6;
  }
  uint64_t v7 = [v5 components:28702 fromDate:v4];

  unint64_t v8 = [v5 dateFromComponents:v7];

  return v8;
}

id FHDateStartOfWeekOnMonday(void *a1)
{
  return FHDateStartOfWeek(a1, 2);
}

id FHDateStartOfLastMonth(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setMonth:-1];
  id v5 = [v3 dateByAddingComponents:v4 toDate:v2 options:0];

  uint64_t v6 = FHDateStartOfMonth(v5);

  return v6;
}

id FHDateStartOfMonth(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  double v3 = [v1 currentCalendar];
  id v4 = [v3 components:14 fromDate:v2];

  id v5 = [v3 dateFromComponents:v4];

  return v5;
}

id FHDateByAddingMonths(void *a1, uint64_t a2)
{
  double v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a1;
  id v5 = [v3 currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setMonth:a2];
  uint64_t v7 = [v5 dateByAddingComponents:v6 toDate:v4 options:0];

  return v7;
}

id FHDateByAddingWeeks(void *a1, uint64_t a2)
{
  double v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a1;
  id v5 = [v3 currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v6 setDay:7 * a2];
  uint64_t v7 = [v5 dateByAddingComponents:v6 toDate:v4 options:0];

  return v7;
}

id FHDateEndOfMonth(void *a1)
{
  id v1 = FHDateByAddingMonths(a1, 1);
  id v2 = FHDateStartOfMonth(v1);
  double v3 = [v2 dateByAddingTimeInterval:-1.0];

  return v3;
}

id FHDateEndOfWeekStartingOnMonday(void *a1)
{
  id v1 = FHDateStartOfWeek(a1, 2);
  id v2 = FHDateByAddingWeeks(v1, 1);

  double v3 = [v2 dateByAddingTimeInterval:-1.0];

  return v3;
}

uint64_t FHIsDateBetweenDates(void *a1, void *a2, void *a3, unsigned int a4, unsigned int a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  long long v12 = v11;
  uint64_t v13 = 0;
  if (v9 && v10 && v11)
  {
    uint64_t v14 = a4 - 1;
    uint64_t v15 = a5 - 1;
    BOOL v16 = [v10 compare:v9] == v14 || objc_msgSend(v10, "compare:", v9) == -1;
    BOOL v17 = [v12 compare:v9] == v15 || objc_msgSend(v12, "compare:", v9) == 1;
    uint64_t v13 = v16 & v17;
  }

  return v13;
}

uint64_t FHNumberOfDaysBetweenDates(void *a1, void *a2, unsigned int a3)
{
  uint64_t v3 = -1;
  if (a1 && a2)
  {
    id v6 = (void *)MEMORY[0x263EFF8F0];
    id v7 = a2;
    id v8 = a1;
    id v9 = [v6 currentCalendar];
    id v10 = [v9 components:16 fromDate:v8 toDate:v7 options:0];

    uint64_t v3 = [v10 day] + a3;
  }
  return v3;
}

uint64_t FHNumberOfDaysBetweenDatesInclusive(void *a1, void *a2)
{
  return FHNumberOfDaysBetweenDates(a1, a2, 1u);
}

id FHShuffledArray(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 count];
  if (v2 < 2)
  {
    id v6 = (void *)[v1 copy];
  }
  else
  {
    unint64_t v3 = v2;
    id v4 = (void *)[v1 mutableCopy];
    unint64_t v5 = v3 - 1;
    do
    {
      [v4 exchangeObjectAtIndex:v5 withObjectAtIndex:arc4random() % v5];
      --v5;
    }
    while (v5);
    id v6 = (void *)[v4 copy];
  }
  return v6;
}

uint64_t FHNumberOfDaysInMonthForDate(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  unint64_t v3 = [v1 currentCalendar];
  [v3 rangeOfUnit:16 inUnit:8 forDate:v2];
  uint64_t v5 = v4;

  return v5;
}

uint64_t FHEqualObjects(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqual:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t FHEqualStrings(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToString:a2];
  }
  else {
    return a1 == a2;
  }
}

void sub_24E0450DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t FHPaymentRingSuggestionCategoryFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"MinimumRemainingPayment"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"LastPayment"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"LastPaymentPlusMerchantCategory1"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"LastPaymentPlusMerchantCategory2"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"NewPurchases"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"PayInNineMonths"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"PayInEightMonths"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"PayInSevenMonths"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"PayInSixMonths"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"PayInFiveMonths"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"PayInFourMonths"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"PayInThreeMonths"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"PayInTwoMonths"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"PayInNineMonthsFromUtilization"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"PayInSixMonthsFromUtilization"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"PayInThreeMonthsFromUtilization"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"PayInPlanCompletion"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"RemainingStatementBalance"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"CurrentBalance"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"OneThirdOfCurrentBalance"])
  {
    uint64_t v2 = 20;
  }
  else if ([v1 isEqualToString:@"OneSixthOfCurrentBalance"])
  {
    uint64_t v2 = 21;
  }
  else if ([v1 isEqualToString:@"OneNinthOfCurrentBalance"])
  {
    uint64_t v2 = 22;
  }
  else if ([v1 isEqualToString:@"PayInThreeMonthsForTransactor"])
  {
    uint64_t v2 = 23;
  }
  else if ([v1 isEqualToString:@"PayInSixMonthsForTransactor"])
  {
    uint64_t v2 = 24;
  }
  else if ([v1 isEqualToString:@"PayInNineMonthsForTransactor"])
  {
    uint64_t v2 = 25;
  }
  else if ([v1 isEqualToString:@"OneThirdOfStatementBalance"])
  {
    uint64_t v2 = 26;
  }
  else if ([v1 isEqualToString:@"OneSixthOfStatementBalance"])
  {
    uint64_t v2 = 27;
  }
  else if ([v1 isEqualToString:@"OneNinthOfStatementBalance"])
  {
    uint64_t v2 = 28;
  }
  else if ([v1 isEqualToString:@"AverageOfMinimumAndStatetmentBalance"])
  {
    uint64_t v2 = 29;
  }
  else if ([v1 isEqualToString:@"CardBalance"])
  {
    uint64_t v2 = 30;
  }
  else if ([v1 isEqualToString:@"CombinedBalance"])
  {
    uint64_t v2 = 31;
  }
  else if ([v1 isEqualToString:@"FHSmartFeatureAggregateTypeAmountVeryExpensive"])
  {
    uint64_t v2 = 32;
  }
  else if ([v1 isEqualToString:@"FHSmartFeatureAggregateTypeRecurring"])
  {
    uint64_t v2 = 33;
  }
  else if ([v1 isEqualToString:@"FHSmartFeatureAggregateTypeTopMerchant"])
  {
    uint64_t v2 = 34;
  }
  else if ([v1 isEqualToString:@"FHSmartFeatureCompoundTypeTripEvents"])
  {
    uint64_t v2 = 35;
  }
  else if ([v1 isEqualToString:@"FHSmartFeatureAggregateTypePeakSpend"])
  {
    uint64_t v2 = 36;
  }
  else if ([v1 isEqualToString:@"Count"])
  {
    uint64_t v2 = 37;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *FHPaymentRingSuggestionCategoryToString(unint64_t a1)
{
  if (a1 > 0x25) {
    return @"unknown";
  }
  else {
    return off_265314DF0[a1];
  }
}

void sub_24E04770C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28)
{
  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_24E047A1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_24E0485C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  objc_destroyWeak(v57);
  _Block_object_dispose(&a57, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24E04934C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *FHRecurringPeerPaymentPeriodicCategoryTypeToString(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"not supported";
      break;
    case 2:
      uint64_t v2 = @"daily";
      break;
    case 3:
      uint64_t v2 = @"weekly";
      break;
    case 4:
      uint64_t v2 = @"biweekly";
      break;
    case 5:
      uint64_t v2 = @"monthly";
      break;
    case 6:
      objc_msgSend(NSString, "stringWithFormat:", @"FHRecurringPeerPaymentPeriodicCategoryTypeCount: %lu", 6);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v2 = @"unknown";
      break;
  }
  return v2;
}

uint64_t FHRecurringPeerPaymentPeriodicCategoryTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"not supported"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"daily"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"weekly"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"biweekly"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"monthly"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t FHTransactionInternalStateFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Dirty"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"RawConsistent"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"UpdatedRealtime"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"UpdatedBatch"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Consistent"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Invalid"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *FHTransactionInternalStateToString(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"Dirty";
      break;
    case 2:
      uint64_t v2 = @"RawConsistent";
      break;
    case 3:
      uint64_t v2 = @"UpdatedRealtime";
      break;
    case 4:
      uint64_t v2 = @"UpdatedBatch";
      break;
    case 5:
      uint64_t v2 = @"Consistent";
      break;
    case 6:
      uint64_t v2 = @"Invalid";
      break;
    case 7:
      objc_msgSend(NSString, "stringWithFormat:", @"FHTransactionInternalStateCount: %lu", 7);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v2 = @"Unknown";
      break;
  }
  return v2;
}

__CFString *FHTransactionAccountTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_265315A90[a1 - 1];
  }
}

uint64_t FHTransactionAccountTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"PeerPayment"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Broadway"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Count"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *FHTransactionPeerPaymentSubtypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_265315AB8[a1 - 1];
  }
}

uint64_t FHTransactionPeerPaymentSubtypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Unknown"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"Send"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Receive"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Request"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Count"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

FHTransaction *TransactionFromPKPaymentTransaction(void *a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v2 = a1;
  unint64_t v3 = objc_alloc_init(FHTransaction);
  if (objc_opt_class())
  {
    id v4 = v2;
    uint64_t v5 = [v4 identifier];
    [(FHTransaction *)v3 setIdentifier:v5];

    id v6 = [v4 serviceIdentifier];
    [(FHTransaction *)v3 setTransactionServiceIdentifier:v6];

    id v7 = [v4 paymentHash];
    [(FHTransaction *)v3 setPaymentHash:v7];

    id v8 = [v4 transactionSourceIdentifier];
    [(FHTransaction *)v3 setTransactionSourceIdentifier:v8];

    id v9 = [v4 amount];
    [(FHTransaction *)v3 setAmount:v9];

    id v10 = [v4 currencyCode];
    [(FHTransaction *)v3 setCurrencyCode:v10];

    id v11 = [v4 transactionDate];
    [(FHTransaction *)v3 setTransactionDate:v11];

    long long v12 = [v4 transactionStatusChangedDate];
    [(FHTransaction *)v3 setTransactionStatusChangedDate:v12];

    -[FHTransaction setTransactionStatus:](v3, "setTransactionStatus:", [v4 transactionStatus]);
    -[FHTransaction setTransactionSource:](v3, "setTransactionSource:", [v4 transactionSource]);
    -[FHTransaction setCardType:](v3, "setCardType:", [v4 cardType]);
    -[FHTransaction setTransactionType:](v3, "setTransactionType:", [v4 transactionType]);
    -[FHTransaction setAccountType:](v3, "setAccountType:", [v4 accountType]);
    uint64_t v13 = [v4 altDSID];
    [(FHTransaction *)v3 setAltDSID:v13];

    uint64_t v14 = [v4 receiptIdentifier];
    [(FHTransaction *)v3 setReceiptIdentifier:v14];

    uint64_t v15 = [v4 associatedReceiptUniqueID];
    [(FHTransaction *)v3 setAssociatedReceiptUniqueID:v15];

    [(FHTransaction *)v3 setTransactionInternalState:0];
    BOOL v16 = [v4 timeZone];
    [(FHTransaction *)v3 setTimeZone:v16];

    BOOL v17 = [v4 merchant];
    uint64_t v18 = [v17 uniqueIdentifier];
    [(FHTransaction *)v3 setMerchantUniqueIdentifier:v18];

    v19 = [v4 merchant];
    v20 = [v19 name];
    [(FHTransaction *)v3 setName:v20];

    v21 = [v4 merchant];
    v22 = [v21 rawName];
    [(FHTransaction *)v3 setRawName:v22];

    v23 = [v4 merchant];
    -[FHTransaction setIndustryCode:](v3, "setIndustryCode:", [v23 industryCode]);

    v24 = [v4 merchant];
    v25 = [v24 industryCategory];
    [(FHTransaction *)v3 setIndustryCategory:v25];

    v26 = [v4 merchant];
    v27 = [v26 displayName];
    [(FHTransaction *)v3 setDisplayName:v27];

    uint64_t v28 = [v4 merchant];
    v29 = [v28 rawCountry];
    [(FHTransaction *)v3 setCountry:v29];

    uint64_t v30 = [v4 merchant];
    -[FHTransaction setCategory:](v3, "setCategory:", [v30 category]);

    v31 = [v4 merchant];
    v32 = [v31 detailedCategory];
    [(FHTransaction *)v3 setMerchantDetailedCategory:v32];

    v33 = [v4 merchant];
    v34 = [v33 mapsMerchant];
    -[FHTransaction setMapsMerchantID:](v3, "setMapsMerchantID:", [v34 identifier]);

    v35 = [v4 merchant];
    v36 = [v35 mapsBrand];
    -[FHTransaction setMapsMerchantBrandID:](v3, "setMapsMerchantBrandID:", [v36 identifier]);

    v37 = [v4 merchant];
    v38 = [v37 mapsMerchant];
    -[FHTransaction setMapsMerchantResultProviderID:](v3, "setMapsMerchantResultProviderID:", [v38 resultProviderIdentifier]);

    v39 = [v4 merchant];
    v40 = [v39 mapsBrand];
    -[FHTransaction setMapsMerchantBrandResultProviderID:](v3, "setMapsMerchantBrandResultProviderID:", [v40 resultProviderIdentifier]);

    v41 = [v4 location];
    [(FHTransaction *)v3 setLocation:v41];

    if (_os_feature_enabled_impl())
    {
      v42 = [(FHTransaction *)v3 location];
      if (v42)
      {
        v40 = [(FHTransaction *)v3 location];
        [v40 coordinate];
        if (v43 != 0.0) {
          goto LABEL_14;
        }
        id v1 = [(FHTransaction *)v3 location];
        [v1 coordinate];
        if (v44 != 0.0) {
          goto LABEL_13;
        }
      }
      uint64_t v45 = [(FHTransaction *)v3 country];
      if (v45)
      {
        v46 = (void *)v45;
        v47 = +[FHTransaction _allowedCountryNamesForMapsMerchant];
        v48 = [(FHTransaction *)v3 country];
        char v49 = [v47 containsObject:v48];

        if (v42)
        {
        }
        if ((v49 & 1) == 0) {
          goto LABEL_16;
        }
        v50 = [v4 merchant];
        v51 = [v50 mapsMerchant];
        v52 = [v51 location];
        [(FHTransaction *)v3 setLocation:v52];

        v42 = FinHealthLogObject(@"FinHealthCore");
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_15;
        }
        v40 = [(FHTransaction *)v3 location];
        int v71 = 138412290;
        v72 = v40;
        _os_log_impl(&dword_24E029000, v42, OS_LOG_TYPE_DEBUG, "FH_GEO_REVERSE_LOOKUP enabled, transaction.location is :%@", (uint8_t *)&v71, 0xCu);
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      if (v42)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_16:
    v53 = [v4 merchant];
    v54 = [v53 mapsMerchant];
    v55 = [v54 postalAddress];

    v56 = [v55 street];
    [(FHTransaction *)v3 setStreet:v56];

    v57 = [v55 ISOCountryCode];
    [(FHTransaction *)v3 setCountryCode:v57];

    if ([(FHTransaction *)v3 transactionSource] == 1)
    {
      v58 = [v55 city];
      [(FHTransaction *)v3 setCity:v58];

      v59 = [v55 state];
      [(FHTransaction *)v3 setState:v59];

      v60 = [v55 postalCode];
      [(FHTransaction *)v3 setZip:v60];
    }
    else
    {
      v61 = [v4 merchant];
      v62 = [v61 city];
      [(FHTransaction *)v3 setCity:v62];

      v63 = [v4 merchant];
      v64 = [v63 state];
      [(FHTransaction *)v3 setState:v64];

      v60 = [v4 merchant];
      v65 = [v60 zip];
      [(FHTransaction *)v3 setZip:v65];
    }
    v66 = [v4 peerPaymentCounterpartHandle];
    [(FHTransaction *)v3 setPeerPaymentCounterpartHandle:v66];

    -[FHTransaction setPeerPaymentType:](v3, "setPeerPaymentType:", [v4 peerPaymentType]);
    v67 = [v4 peerPaymentMemo];
    [(FHTransaction *)v3 setTransactionDescription:v67];

    -[FHTransaction setRecurring:](v3, "setRecurring:", [v4 isRecurring]);
    -[FHTransaction setDisputeType:](v3, "setDisputeType:", [v4 disputeType]);
    -[FHTransaction setDisputeStatus:](v3, "setDisputeStatus:", [v4 disputeStatus]);
    v68 = [v4 disputeOpenDate];
    [(FHTransaction *)v3 setDisputeOpenDate:v68];

    uint64_t v69 = [v4 disputeLastUpdatedDate];
    [(FHTransaction *)v3 setDisputeLastUpdatedDate:v69];
  }
  return v3;
}

FHTransaction *TransactionFromArray(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(FHTransaction);
  uint64_t v3 = (int)[v1 intAtIndex:6];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithInteger:v3];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v1, "unsignedIntAtIndex:", 9));
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v1, "unsignedIntAtIndex:", 11));
  id v7 = [v1 stringAtIndex:1];
  [(FHTransaction *)v2 setIdentifier:v7];

  id v8 = [v1 stringAtIndex:2];
  [(FHTransaction *)v2 setTransactionServiceIdentifier:v8];

  id v9 = [v1 stringAtIndex:3];
  [(FHTransaction *)v2 setFinanceTransactionIdentifier:v9];

  id v10 = [v1 stringAtIndex:4];
  [(FHTransaction *)v2 setPaymentHash:v10];

  id v11 = [v1 stringAtIndex:5];
  [(FHTransaction *)v2 setTransactionSourceIdentifier:v11];

  long long v12 = [MEMORY[0x263F087B0] defaultDatabaseAmountMultiplier];
  uint64_t v13 = [v4 decimalNumberByDividingBy:v12];
  [(FHTransaction *)v2 setAmount:v13];

  [(FHTransaction *)v2 setAmountFromDatabase:v3];
  uint64_t v14 = [v1 stringAtIndex:7];
  [(FHTransaction *)v2 setCurrencyCode:v14];

  [(FHTransaction *)v2 setTransactionDate:v5];
  -[FHTransaction setTransactionStatus:](v2, "setTransactionStatus:", (int)[v1 intAtIndex:10]);
  [(FHTransaction *)v2 setTransactionStatusChangedDate:v6];
  -[FHTransaction setTransactionSource:](v2, "setTransactionSource:", (int)[v1 intAtIndex:12]);
  -[FHTransaction setCardType:](v2, "setCardType:", (int)[v1 intAtIndex:13]);
  -[FHTransaction setTransactionType:](v2, "setTransactionType:", (int)[v1 intAtIndex:14]);
  -[FHTransaction setAccountType:](v2, "setAccountType:", (int)[v1 intAtIndex:15]);
  uint64_t v15 = [v1 stringAtIndex:16];
  [(FHTransaction *)v2 setAltDSID:v15];

  BOOL v16 = [v1 stringAtIndex:17];
  [(FHTransaction *)v2 setReceiptIdentifier:v16];

  BOOL v17 = [v1 stringAtIndex:18];
  [(FHTransaction *)v2 setAssociatedReceiptUniqueID:v17];

  -[FHTransaction setTransactionInternalState:](v2, "setTransactionInternalState:", (int)[v1 intAtIndex:19]);
  uint64_t v18 = [v1 stringAtIndex:20];
  [(FHTransaction *)v2 setMerchantUniqueIdentifier:v18];

  -[FHTransaction setIndustryCode:](v2, "setIndustryCode:", (int)[v1 intAtIndex:21]);
  v19 = [v1 stringAtIndex:22];
  [(FHTransaction *)v2 setName:v19];

  v20 = [v1 stringAtIndex:23];
  [(FHTransaction *)v2 setRawName:v20];

  -[FHTransaction setCategory:](v2, "setCategory:", (int)[v1 intAtIndex:24]);
  v21 = [v1 stringAtIndex:25];
  [(FHTransaction *)v2 setMerchantDetailedCategory:v21];

  v22 = [v1 stringAtIndex:26];
  [(FHTransaction *)v2 setDisplayName:v22];

  v23 = [v1 stringAtIndex:27];
  [(FHTransaction *)v2 setStreet:v23];

  v24 = [v1 stringAtIndex:28];
  [(FHTransaction *)v2 setCity:v24];

  v25 = [v1 stringAtIndex:29];
  [(FHTransaction *)v2 setState:v25];

  v26 = [v1 stringAtIndex:30];
  [(FHTransaction *)v2 setZip:v26];

  v27 = [v1 stringAtIndex:31];
  [(FHTransaction *)v2 setCountryCode:v27];

  uint64_t v28 = [v1 stringAtIndex:32];
  [(FHTransaction *)v2 setCountry:v28];

  v29 = [v1 stringAtIndex:33];
  -[FHTransaction setMapsMerchantID:](v2, "setMapsMerchantID:", [v29 longLongValue]);

  -[FHTransaction setMapsMerchantResultProviderID:](v2, "setMapsMerchantResultProviderID:", [v1 intAtIndex:34]);
  uint64_t v30 = [v1 stringAtIndex:35];
  -[FHTransaction setMapsMerchantBrandID:](v2, "setMapsMerchantBrandID:", [v30 longLongValue]);

  -[FHTransaction setMapsMerchantBrandResultProviderID:](v2, "setMapsMerchantBrandResultProviderID:", [v1 intAtIndex:36]);
  v31 = [v1 stringAtIndex:43];
  [(FHTransaction *)v2 setPeerPaymentCounterpartHandle:v31];

  -[FHTransaction setPeerPaymentType:](v2, "setPeerPaymentType:", (int)[v1 intAtIndex:44]);
  v32 = [v1 stringAtIndex:45];
  [(FHTransaction *)v2 setTransactionDescription:v32];

  -[FHTransaction setRecurring:](v2, "setRecurring:", [v1 intAtIndex:46] != 0);
  v33 = [v1 objectAtIndex:37];
  [v33 doubleValue];
  CLLocationDegrees v35 = v34;

  v36 = [v1 objectAtIndex:38];
  [v36 doubleValue];
  CLLocationDegrees v38 = v37;

  v39 = [v1 objectAtIndex:40];
  [v39 doubleValue];
  double v41 = v40;

  v42 = [v1 objectAtIndex:39];
  [v42 doubleValue];
  double v44 = v43;

  CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(v35, v38);
  if ((v35 != 0.0 || v38 != 0.0) && CLLocationCoordinate2DIsValid(v45))
  {
    id v46 = objc_alloc(MEMORY[0x263F00A50]);
    v47 = [MEMORY[0x263EFF910] now];
    v48 = objc_msgSend(v46, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v47, v45.latitude, v45.longitude, 0.0, v41, v44);
    [(FHTransaction *)v2 setLocation:v48];
  }
  if ([v1 intAtIndex:8])
  {
    char v49 = objc_msgSend(MEMORY[0x263EFFA18], "timeZoneForSecondsFromGMT:", (int)objc_msgSend(v1, "intAtIndex:", 8));
    [(FHTransaction *)v2 setTimeZone:v49];
  }
  -[FHTransaction setDisputeType:](v2, "setDisputeType:", (int)[v1 intAtIndex:41]);
  -[FHTransaction setDisputeStatus:](v2, "setDisputeStatus:", (int)[v1 intAtIndex:42]);
  int v50 = [v1 unsignedIntAtIndex:47];
  int v51 = [v1 unsignedIntAtIndex:48];
  if (v50 >= 1)
  {
    int v52 = v51;
    if (v51 >= 1)
    {
      v53 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:(double)v50];
      [(FHTransaction *)v2 setDisputeOpenDate:v53];

      v54 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:(double)v52];
      [(FHTransaction *)v2 setDisputeLastUpdatedDate:v54];
    }
  }

  return v2;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x270F9B440]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x270F9B448]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x270F9A428](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x270F9A4C8](v);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x270F9B7C8](*(void *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}