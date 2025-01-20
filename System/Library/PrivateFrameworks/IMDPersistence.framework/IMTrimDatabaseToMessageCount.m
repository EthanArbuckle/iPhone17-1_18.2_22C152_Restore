@interface IMTrimDatabaseToMessageCount
- (IMTrimDatabaseToMessageCount)initWithSourceDatabasePath:(id)a3 destinationDatabasePath:(id)a4 messageCount:(int64_t)a5;
- (int64_t)messageCount;
- (void)performMessageSelectionWithOperation:(IMDSqlOperation *)a3;
@end

@implementation IMTrimDatabaseToMessageCount

- (IMTrimDatabaseToMessageCount)initWithSourceDatabasePath:(id)a3 destinationDatabasePath:(id)a4 messageCount:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)IMTrimDatabaseToMessageCount;
  result = [(IMAbstractDatabaseArchiver *)&v7 initWithSourceDatabasePath:a3 destinationDatabasePath:a4];
  if (result) {
    result->_messageCount = a5;
  }
  return result;
}

- (void)performMessageSelectionWithOperation:(IMDSqlOperation *)a3
{
  _IMDSqlOperationBeginQuery((uint64_t)a3, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO message SELECT %@ from source.message ORDER BY DATE DESC LIMIT ?;",
                   @"ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid"));
  IMDSqlStatementBindInt64((uint64_t)&a3->var4, self->_messageCount);
  IMDSqlOperationFinishQuery((uint64_t)a3);
}

- (int64_t)messageCount
{
  return self->_messageCount;
}

@end